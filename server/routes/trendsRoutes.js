const express = require('express');
const trends = require('../controllers/trends');
const { requireAuth } = require('../middleware/authmiddleware');

const trendRoutes = express.Router();

trendRoutes.get('/trends',requireAuth,trends.trends);
trendRoutes.post('/trend',requireAuth,trends.createtrend);
trendRoutes.get('/trend/:id',requireAuth,trends.trend);

trendRoutes.put('/trend/:id',requireAuth,trends.updatetrend);

trendRoutes.delete('/trend/:id',requireAuth,trends.deletetrend);

module.exports = trendRoutes;