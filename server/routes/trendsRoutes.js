const express = require('express');
const trends = require('../controllers/trends');
const { verifyToken } = require('../middleware/authmiddleware');

const trendRoutes = express.Router();

trendRoutes.get('/trends',trends.trends);
trendRoutes.post('/trend',verifyToken,trends.createtrend);
trendRoutes.get('/trend/:id',trends.trend);
trendRoutes.put('/trend/:id',verifyToken,trends.updatetrend);

trendRoutes.delete('/trend/:id',verifyToken,trends.deletetrend);

module.exports = trendRoutes;