const express = require('express');
const trends = require('../controllers/trends');
const { requireAuth } = require('../middleware/authmiddleware');

const trendRoutes = express.Router();

trendRoutes.get('/trends',trends.trends);
trendRoutes.post('/trend',trends.createtrend);
trendRoutes.get('/trend/:id',trends.trend);

trendRoutes.put('/trend/:id',trends.updatetrend);

trendRoutes.delete('/trend/:id',trends.deletetrend);

module.exports = trendRoutes;