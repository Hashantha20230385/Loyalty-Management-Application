//Main Server File
require('dotenv').config();
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const customerRoutes = require('./routes/customers');
const segmentationRoutes = require('./routes/segmentation');
const pointsRoutes = require('./routes/points');
const tierRoutes = require('./routes/tiers');

const app = express();

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Routes
app.use('/customers', customerRoutes);
app.use('/segmentation', segmentationRoutes);
app.use('/points', pointsRoutes);
app.use('/tiers', tierRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});