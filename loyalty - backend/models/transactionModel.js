const { pool } = require('../config/db');
const { v4: uuidv4 } = require('uuid');
const LoyaltyModel = require('./loyaltyModel');
const CustomerModel = require('./customerModel');

const TransactionModel = {
  // Create a new transaction
  create: async (transactionData) => {
    const { customer_id, total_amount, products, points_redeemed = 0 } = transactionData;
    
    // Start a transaction
    const connection = await pool.getConnection();
    try {
      await connection.beginTransaction();
      
      // Generate invoice ID
      const invoice_id = `INV-${uuidv4().substring(0, 8)}`;
      
      // Get current points structure
      const pointsStructure = await LoyaltyModel.getPointsStructure();
      if (!pointsStructure) {
        throw new Error('Points structure not found');
      }
      
      // Calculate points earned
      const points_earned = Math.floor(total_amount / pointsStructure.spend_amount) * pointsStructure.points_awarded;
      
      // Insert transaction
      await connection.query(
        'INSERT INTO transactions (invoice_id, customer_id, total_amount, points_earned, points_redeemed) VALUES (?, ?, ?, ?, ?)',
        [invoice_id, customer_id, total_amount, points_earned, points_redeemed]
      );
      
      // Insert products
      for (const product of products) {
        const { product_id, product_name, quantity, discount, amount } = product;
        
        await connection.query(
          'INSERT INTO product_purchased (invoice_id, product_id, product_name, quantity, discount, amount) VALUES (?, ?, ?, ?, ?, ?)',
          [invoice_id, product_id, product_name, quantity, discount, amount]
        );
      }
      
      // Update customer points
      await CustomerModel.updatePoints(customer_id, points_earned, points_redeemed);
      
      // Add to loyalty history (points earned)
      if (points_earned > 0) {
        await LoyaltyModel.addLoyaltyHistory({
          customer_id,
          invoice_id,
          status: 'earned',
          points: points_earned
        });
      }
      
      // Add to loyalty history (points redeemed)
      if (points_redeemed > 0) {
        await LoyaltyModel.addLoyaltyHistory({
          customer_id,
          invoice_id,
          status: 'redeemed',
          points: points_redeemed
        });
      }
      
      // Recalculate customer tier
      const customer = await CustomerModel.getById(customer_id);
      const tiers = await LoyaltyModel.getAllTiers();
      
      // Find appropriate tier based on available points
      let newTier = tiers[0]; // Default to lowest tier
      
      for (const tier of tiers) {
        if (customer.available_points >= tier.threshold) {
          if (tier.threshold > newTier.threshold) {
            newTier = tier;
          }
        }
      }
      
      // Update customer tier if needed
      if (customer.tier !== newTier.tier_name) {
        await CustomerModel.updateTier(customer_id, newTier.tier_name);
      }
      
      await connection.commit();
      
      return {
        invoice_id,
        points_earned,
        points_redeemed,
        new_tier: newTier.tier_name
      };
    } catch (error) {
      await connection.rollback();
      throw error;
    } finally {
      connection.release();
    }
  },
  
  // Get all transactions
  getAll: async () => {
    try {
      const [rows] = await pool.query(
        'SELECT * FROM transactions ORDER BY invoice_date DESC'
      );
      return rows;
    } catch (error) {
      throw error;
    }
  },
  
  // Get transaction by invoice ID
  getByInvoiceId: async (invoiceId) => {
    try {
      const [transactionRows] = await pool.query(
        'SELECT * FROM transactions WHERE invoice_id = ?',
        [invoiceId]
      );
      
      if (transactionRows.length === 0) {
        return null;
      }
      
      const transaction = transactionRows[0];
      
      // Get purchased products
      const [productRows] = await pool.query(
        'SELECT * FROM product_purchased WHERE invoice_id = ?',
        [invoiceId]
      );
      
      return {
        ...transaction,
        products: productRows
      };
    } catch (error) {
      throw error;
    }
  },
  
  // Get transactions by customer ID
  getByCustomerId: async (customerId) => {
    try {
      const [rows] = await pool.query(
        'SELECT * FROM transactions WHERE customer_id = ? ORDER BY invoice_date DESC',
        [customerId]
      );
      return rows;
    } catch (error) {
      throw error;
    }
  },
  
  // Get transaction details including purchased products
  getTransactionDetails: async (invoiceId) => {
    try {
      const transaction = await this.getByInvoiceId(invoiceId);
      
      if (!transaction) {
        return null;
      }
      
      // Get customer details
      const customer = await CustomerModel.getById(transaction.customer_id);
      
      return {
        transaction,
        customer
      };
    } catch (error) {
      throw error;
    }
  }
};

module.exports = TransactionModel;