// Connecting to the Backend
const express = require('express');
const bodyParser = require('body-parser');
const { Pool } = require('pg');

const app = express();
app.use(bodyParser.json());

const pool = new Pool({
    user: 'your_user',
    host: 'localhost',
    database: 'loyalty_db',
    password: 'your_password',
    port: 5432,
});

// Register Customer API
app.post('/register', async (req, res) => {
    const { firstName, lastName, email, mobile, address, identificationNo } = req.body;
    try {
        await pool.query(
            'INSERT INTO customers (first_name, last_name, email, mobile, address, identification_no) VALUES ($1, $2, $3, $4, $5, $6)',
            [firstName, lastName, email, mobile, address, identificationNo]
        );
        res.status(201).send('Customer registered successfully.');
    } catch (error) {
        res.status(500).send('Registration failed.');
    }
});

app.listen(3000, () => console.log('Server running on port 3000'));
