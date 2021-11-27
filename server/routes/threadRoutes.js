const express = require('express');
const threads = require('../controllers/thread');
const { verifyToken } = require('../middleware/authmiddleware');
const { imageUpload } = require('../middleware/imageUpload');

const threadRoutes = express.Router();

threadRoutes.get('/threads',  threads.threads);
threadRoutes.get('/readImage/:filename', threads.readImage);
threadRoutes.post('/thread',verifyToken,imageUpload.single('image'),threads.createthread);
threadRoutes.get('/thread/:id',threads.thread);
threadRoutes.put('/thread/:id',verifyToken,threads.updatethread);
threadRoutes.delete('/thread/:id',verifyToken, threads.deletethread);

module.exports = threadRoutes;