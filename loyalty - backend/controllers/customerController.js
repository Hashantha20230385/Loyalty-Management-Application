const CustomerModel = require('../models/customerModel');

const CustomerController = {
  // Register a new customer
  registerCustomer: async (req, res) => {
    try {
      const { first_name, last_name, email, mobile, address, identification_no } = req.body;
      
      // Check if customer already exists
      const emailExists = await CustomerModel.getByEmail(email);
      if (emailExists) {
        return res.status(400).json({ message: 'Email already registered' });
      }
      
      const mobileExists = await CustomerModel.getByMobile(mobile);
      if (mobileExists) {
        return res.status(400).json({ message: 'Mobile number already registered' });
      }
      
      const idExists = await CustomerModel.getByIdentificationNo(identification_no);
      if (idExists) {
        return res.status(400).json({ message: 'Identification number already registered' });
      }
      
      // Create new customer
      const customerId = await CustomerModel.create({
        first_name,
        last_name,
        email,
        mobile,
        address,
        identification_no
      });
      
      res.status(201).json({
        message: 'Customer registered successfully',
        customer_id: customerId
      });
    } catch (error) {
      console.error('Error registering customer:', error);
      res.status(500).json({ message: 'Server error', error: error.message });
    }
  },
  
  // Get all customers
  getAllCustomers: async (req, res) => {
    try {
      const customers = await CustomerModel.getAll();
      res.json(customers);
    } catch (error) {
      console.error('Error getting customers:', error);
      res.status(500).json({ message: 'Server error', error: error.message });
    }
  },
  
  // Get customer by ID
  getCustomerById: async (req, res) => {
    try {
      const customerId = req.params.id;
      const customer = await CustomerModel.getById(customerId);
      
      if (!customer) {
        return res.status(404).json({ message: 'Customer not found' });
      }
      
      res.json(customer);
    } catch (error) {
      console.error('Error getting customer:', error);
      res.status(500).json({ message: 'Server error', error: error.message });
    }
  },
  
  // Get customer by mobile
  getCustomerByMobile: async (req, res) => {
    try {
      const mobile = req.params.mobile;
      const customer = await CustomerModel.getByMobile(mobile);
      
      if (!customer) {
        return res.status(404).json({ message: 'Customer not found' });
      }
      
      res.json(customer);
    } catch (error) {
      console.error('Error getting customer by mobile:', error);
      res.status(500).json({ message: 'Server error', error: error.message });
    }
  },
  
  // Update customer profile
  updateCustomer: async (req, res) => {
    try {
      const customerId = req.params.id;
      const { first_name, last_name, email, mobile, address } = req.body;
      
      // Check if customer exists
      const customer = await CustomerModel.getById(customerId);
      if (!customer) {
        return res.status(404).json({ message: 'Customer not found' });
      }
      
      // Check if email is already used by another customer
      if (email !== customer.email) {
        const emailExists = await CustomerModel.getByEmail(email);
        if (emailExists) {
          return res.status(400).json({ message: 'Email already registered' });
        }
      }
      
      // Check if mobile is already used by another customer
      if (mobile !== customer.mobile) {
        const mobileExists = await CustomerModel.getByMobile(mobile);
        if (mobileExists) {
          return res.status(400).json({ message: 'Mobile number already registered' });
        }
      }
      
      // Update customer
      const updated = await CustomerModel.update(customerId, {
        first_name,
        last_name,
        email,
        mobile,
        address
      });
      
      if (!updated) {
        return res.status(400).json({ message: 'Failed to update customer' });
      }
      
      res.json({ message: 'Customer updated successfully' });
    } catch (error) {
      console.error('Error updating customer:', error);
      res.status(500).json({ message: 'Server error', error: error.message });
    }
  },
  
  // Delete a customer
  deleteCustomer: async (req, res) => {
    try {
      const customerId = req.params.id;
      
      // Check if customer exists
      const customer = await CustomerModel.getById(customerId);
      if (!customer) {
        return res.status(404).json({ message: 'Customer not found' });
      }
      
      // Delete customer
      const deleted = await CustomerModel.delete(customerId);
      
      if (!deleted) {
        return res.status(400).json({ message: 'Failed to delete customer' });
      }
      
      res.json({ message: 'Customer deleted successfully' });
    } catch (error) {
      console.error('Error deleting customer:', error);
      res.status(500).json({ message: 'Server error', error: error.message });
    }
  }
};

module.exports = CustomerController;