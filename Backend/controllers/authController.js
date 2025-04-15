const UserModel = require('../models/userModel');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
require('dotenv').config();

const AuthController = {
  // Login user
  login: async (req, res) => {
    try {
      const { username, password } = req.body;
      
      // Check if user exists
      const user = await UserModel.getByUsername(username);
      if (!user) {
        return res.status(401).json({ message: 'Invalid credentials' });
      }
      
      // Check password
      const isMatch = await bcrypt.compare(password, user.password);
      if (!isMatch) {
        return res.status(401).json({ message: 'Invalid credentials' });
      }
      
      // Create JWT payload
      const payload = {
        user: {
          id: user.user_id,
          username: user.username,
          role: user.role
        }
      };
      
      // Sign token
      jwt.sign(
        payload,
        process.env.JWT_SECRET || 'secret_key',
        { expiresIn: '12h' },
        (err, token) => {
          if (err) throw err;
          res.json({
            token,
            user: {
              id: user.user_id,
              username: user.username,
              first_name: user.first_name,
              last_name: user.last_name,
              email: user.email,
              role: user.role,
              department: user.department
            }
          });
        }
      );
    } catch (error) {
      console.error('Login error:', error);
      res.status(500).json({ message: 'Server error', error: error.message });
    }
  },
  
  // Register new user (admin only)
  register: async (req, res) => {
    try {
      const { username, password, first_name, last_name, email, department, role } = req.body;
      
      // Check if username already exists
      const usernameExists = await UserModel.getByUsername(username);
      if (usernameExists) {
        return res.status(400).json({ message: 'Username already exists' });
      }
      
      // Check if email already exists
      const emailExists = await UserModel.getByEmail(email);
      if (emailExists) {
        return res.status(400).json({ message: 'Email already exists' });
      }
      
      // Create user
      const userId = await UserModel.create({
        username,
        password,
        first_name,
        last_name,
        email,
        department,
        role
      });
      
      res.status(201).json({
        message: 'User created successfully',
        user_id: userId
      });
    } catch (error) {
      console.error('Registration error:', error);
      res.status(500).json({ message: 'Server error', error: error.message });
    }
  },
  
  // Get current user
  getCurrentUser: async (req, res) => {
    try {
      const user = await UserModel.getById(req.user.id);
      
      if (!user) {
        return res.status(404).json({ message: 'User not found' });
      }
      
      res.json({
        id: user.user_id,
        username: user.username,
        first_name: user.first_name,
        last_name: user.last_name,
        email: user.email,
        role: user.role,
        department: user.department
      });
    } catch (error) {
      console.error('Get current user error:', error);
      res.status(500).json({ message: 'Server error', error: error.message });
    }
  },
  
  // Change password
  changePassword: async (req, res) => {
    try {
      const { current_password, new_password } = req.body;
      
      // Get user with password
      const [rows] = await pool.query('SELECT * FROM users WHERE user_id = ?', [req.user.id]);
      const user = rows[0];
      
      if (!user) {
        return res.status(404).json({ message: 'User not found' });
      }
      
      // Check current password
      const isMatch = await bcrypt.compare(current_password, user.password);
      if (!isMatch) {
        return res.status(401).json({ message: 'Current password is incorrect' });
      }
      
      // Update password
      const updated = await UserModel.updatePassword(req.user.id, new_password);
      
      if (!updated) {
        return res.status(400).json({ message: 'Failed to update password' });
      }
      
      res.json({ message: 'Password updated successfully' });
    } catch (error) {
      console.error('Change password error:', error);
      res.status(500).json({ message: 'Server error', error: error.message });
    }
  }
};

module.exports = AuthController;