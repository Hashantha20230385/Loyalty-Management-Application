import api from '../utils/api';

const transactionService = {
  // Get all transactions
  getAllTransactions: async () => {
    const response = await api.get('/transactions');
    return response.data;
  },
  
  // Get transaction by invoice ID
  getTransactionByInvoiceId: async (invoiceId) => {
    const response = await api.get(`/transactions/${invoiceId}`);
    return response.data;
  },
  
  // Get transaction details
  getTransactionDetails: async (invoiceId) => {
    const response = await api.get(`/transactions/${invoiceId}/details`);
    return response.data;
  },
  
  // Create transaction
  createTransaction: async (transactionData) => {
    const response = await api.post('/transactions', transactionData);
    return response.data;
  },
  
  // Get customer transactions
  getCustomerTransactions: async (customerId) => {
    const response = await api.get(`/transactions/customer/${customerId}`);
    return response.data;
  }
};

export default transactionService;