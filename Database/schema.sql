-- Loyalty Management System Database Schema

-- Create the database
CREATE DATABASE IF NOT EXISTS loyalty_management;
USE loyalty_management;

-- Create customers table
CREATE TABLE IF NOT EXISTS customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  mobile VARCHAR(15) UNIQUE NOT NULL,
  address TEXT NOT NULL,
  identification_no VARCHAR(50) UNIQUE NOT NULL,
  earned_points INT DEFAULT 0,
  redeemed_points INT DEFAULT 0,
  available_points INT DEFAULT 0,
  tier VARCHAR(20) DEFAULT 'Purple',
  join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create users table
CREATE TABLE IF NOT EXISTS users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  department VARCHAR(50),
  role VARCHAR(50) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create products table
CREATE TABLE IF NOT EXISTS products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  category VARCHAR(50) NOT NULL,
  selling_price DECIMAL(10, 2) NOT NULL,
  discount DECIMAL(5, 2) DEFAULT 0.00
);

-- Create transactions table
CREATE TABLE IF NOT EXISTS transactions (
  invoice_id VARCHAR(50) PRIMARY KEY,
  customer_id INT NOT NULL,
  total_amount DECIMAL(10, 2) NOT NULL,
  points_earned INT DEFAULT 0,
  points_redeemed INT DEFAULT 0,
  invoice_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create product_purchased table
CREATE TABLE IF NOT EXISTS product_purchased (
  id INT AUTO_INCREMENT PRIMARY KEY,
  invoice_id VARCHAR(50) NOT NULL,
  product_id INT NOT NULL,
  product_name VARCHAR(100) NOT NULL,
  quantity INT NOT NULL,
  discount DECIMAL(5, 2) DEFAULT 0.00,
  amount DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (invoice_id) REFERENCES transactions(invoice_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create loyalty_history table
CREATE TABLE IF NOT EXISTS loyalty_history (
  loyalty_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  invoice_id VARCHAR(50),
  status ENUM('earned', 'redeemed', 'cancelled', 'expired') NOT NULL,
  points INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (invoice_id) REFERENCES transactions(invoice_id)
);

-- Create loyalty_tiers table
CREATE TABLE IF NOT EXISTS loyalty_tiers (
  tier_id INT AUTO_INCREMENT PRIMARY KEY,
  tier_name VARCHAR(50) NOT NULL,
  threshold INT NOT NULL,
  discount DECIMAL(5, 2) DEFAULT 0.00,
  description TEXT
);

-- Create points_structure table
CREATE TABLE IF NOT EXISTS points_structure (
  id INT AUTO_INCREMENT PRIMARY KEY,
  spend_amount DECIMAL(10, 2) NOT NULL,
  points_awarded INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create rewards table
CREATE TABLE IF NOT EXISTS rewards (
  reward_id INT AUTO_INCREMENT PRIMARY KEY,
  reward_name VARCHAR(100) NOT NULL,
  points_required INT NOT NULL,
  discount_value DECIMAL(5, 2),
  description TEXT,
  active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create customer_segments table
CREATE TABLE IF NOT EXISTS customer_segments (
  segment_id INT AUTO_INCREMENT PRIMARY KEY,
  segment_name VARCHAR(100) NOT NULL,
  criteria JSON NOT NULL,
  created_by INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (created_by) REFERENCES users(user_id)
);

-- Create segment_customers junction table
CREATE TABLE IF NOT EXISTS segment_customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  segment_id INT NOT NULL,
  customer_id INT NOT NULL,
  FOREIGN KEY (segment_id) REFERENCES customer_segments(segment_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  UNIQUE (segment_id, customer_id)
);
