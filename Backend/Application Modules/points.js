// Loyalty Points Structure Management
const express = require('express');
const pool = require('../db');
const router = express.Router();

// Get current points structure
router.get('/', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM points_structure');
        res.json(result.rows[0]);
    } catch (error) {
        res.status(500).send('Error retrieving points structure');
    }
});

// Update points structure
router.post('/update', async (req, res) => {
    const { spend, points } = req.body;
    try {
        await pool.query('UPDATE points_structure SET spend_amount = $1, points_awarded = $2', [spend, points]);
        res.status(200).send('Points structure updated successfully');
    } catch (error) {
        res.status(500).send('Error updating points structure');
    }
});

module.exports = router;