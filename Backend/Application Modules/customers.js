// Customer Profile Management
const express = require('express');
const pool = require('../db');
const router = express.Router();

// Get all customers
router.get('/', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM customers');
        res.json(result.rows);
    } catch (error) {
        res.status(500).send('Error retrieving customers');
    }
});

// Register new customer
router.post('/register', async (req, res) => {
    const { firstName, lastName, email, mobile, address, identificationNo } = req.body;
    try {
        await pool.query(
            'INSERT INTO customers (first_name, last_name, email, mobile, address, identification_no) VALUES ($1, $2, $3, $4, $5, $6)',
            [firstName, lastName, email, mobile, address, identificationNo]
        );
        res.status(201).send('Customer registered successfully');
    } catch (error) {
        res.status(500).send('Registration failed');
    }
});

module.exports = router;