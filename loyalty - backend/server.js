const express = require('express');
const cors = require('cors');
const { testConnection } = require('./config/db');
require('dotenv').config();

// Import routes
const authRoutes = require('./routes/authRoutes');
const customerRoutes = require('./routes/customerRoutes');
const loyaltyRoutes = require('./routes/loyaltyRoutes');
const segmentRoutes = require('./routes/segmentRoutes');
const transactionRoutes = require('./routes/transactionRoutes');

// Initialize express app
const app = express();

// Test database connection
testConnection();

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Route middleware
app.use('/api/auth', authRoutes);
app.use('/api/customers', customerRoutes);
app.use('/api/loyalty', loyaltyRoutes);
app.use('/api/segments', segmentRoutes);
app.use('/api/transactions', transactionRoutes);

// Root route
app.get('/', (req, res) => {
  res.send('Loyalty Management API is running');
});

// Handle 404 errors
app.use((req, res) => {
  res.status(404).json({ message: 'Route not found' });
});

// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});