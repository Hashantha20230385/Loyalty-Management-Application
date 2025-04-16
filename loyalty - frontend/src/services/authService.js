import api from '../utils/api';

const authService = {
  // Login user
  login: async (username, password) => {
    const response = await api.post('/auth/login', { username, password });
    return response.data;
  },
  
  // Get current user
  getCurrentUser: async () => {
    const response = await api.get('/auth/me');
    return response.data;
  },
  
  // Change password
  changePassword: async (current_password, new_password) => {
    const response = await api.put('/auth/change-password', { current_password, new_password });
    return response.data;
  },
  
  // Register new user (admin only)
  registerUser: async (userData) => {
    const response = await api.post('/auth/register', userData);
    return response.data;
  }
};

export default authService;