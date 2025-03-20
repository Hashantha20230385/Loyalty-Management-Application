// Customer Segmentation
const express = require('express');
const pool = require('../db');
const router = express.Router();

// Create customer segment based on points
router.post('/create-segment', async (req, res) => {
    const { minPoints } = req.body;
    try {
        const result = await pool.query('SELECT * FROM customers WHERE points >= $1', [minPoints]);
        res.json(result.rows);
    } catch (error) {
        res.status(500).send('Error creating customer segment');
    }
});

module.exports = router;