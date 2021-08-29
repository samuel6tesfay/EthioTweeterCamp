const express = require('express');
const threads = require('../controllers/thread');
const { requireAuth } = require('../middleware/authmiddleware');


const threadRoutes = express.Router();

threadRoutes.get('/threads',requireAuth,threads.threads);
threadRoutes.post('/thread',requireAuth,threads.createthread);
threadRoutes.get('/thread/:id',requireAuth,threads.thread);

threadRoutes.put('/thread/:id',requireAuth,threads.updatethread);

threadRoutes.delete('/thread/:id',requireAuth,threads.deletethread);

module.exports = threadRoutes;