require('dotenv').config()


const express = require('express');
const authRoutes = require('./routes/authRoutes')
const threadRoutes = require('./routes/threadRoutes')
const trendRoutes = require('./routes/trendsRoutes')
const relevant_peopleRoutes = require('./routes/relevant_peopleRoutes')

const cookieParser = require('cookie-parser');

const cors = require('cors');

const app = express();
app.use(cors())
app.use(express.json())
app.use(cookieParser());


app.use(authRoutes)
app.use(threadRoutes)
app.use(trendRoutes)
app.use(relevant_peopleRoutes)


app.listen(4003,()=>console.log("server up and running 4003"));

