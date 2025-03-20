// Tier Structure Management
const express = require('express');
const pool = require('../db');
const router = express.Router();

// Get all tiers
router.get('/', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM tiers');
        res.json(result.rows);
    } catch (error) {
        res.status(500).send('Error retrieving tiers');
    }
});

// Update tier structure
router.post('/update', async (req, res) => {
    const { tiers } = req.body;
    try {
        for (const tier of tiers) {
            await pool.query('UPDATE tiers SET threshold = $1, discount = $2 WHERE name = $3', [tier.threshold, tier.discount, tier.name]);
        }
        res.status(200).send('Tier structure updated successfully');
    } catch (error) {
        res.status(500).send('Error updating tier structure');
    }
});

module.exports = router;