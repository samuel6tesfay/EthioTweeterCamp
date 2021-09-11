const express = require('express');
const relevant_peoples = require('../controllers/relevant_people');
const { requireAuth } = require('../middleware/authmiddleware');

const relevant_peopleRoutes = express.Router();

// relevant_peopleRoutes.get('/relevant_peoples',requireAuth,relevant_peoples.relevant_peoples);
relevant_peopleRoutes.get('/relevant_peoples',relevant_peoples.relevant_peoples);
relevant_peopleRoutes.post('/relevant_people',relevant_peoples.createrelevant_people);
relevant_peopleRoutes.get('/relevant_people/:id',relevant_peoples.relevant_people);
relevant_peopleRoutes.put('/relevant_people/:id',relevant_peoples.updaterelevant_people);
relevant_peopleRoutes.delete('/relevant_people/:id',relevant_peoples.deleterelevant_people);

module.exports = relevant_peopleRoutes;