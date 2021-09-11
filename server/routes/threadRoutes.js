const express = require('express');
const threads = require('../controllers/thread');
const { requireAuth } = require('../middleware/authmiddleware');


const threadRoutes = express.Router();

threadRoutes.get('/threads',threads.threads);
threadRoutes.post('/thread',threads.createthread);
threadRoutes.get('/thread/:id',threads.thread);

threadRoutes.put('/thread/:id',threads.updatethread);

threadRoutes.delete('/thread/:id',threads.deletethread);

module.exports = threadRoutes;