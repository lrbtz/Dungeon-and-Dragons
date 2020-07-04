require('dotenv').config();
const express = require('express');
const session = require('express-session');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser')
const db = require('../src/utils/db');

const app = express();
app.use(bodyParser.json({ limit: '5mb' }));
app.use(cookieParser());
app.use(session({
    resave: false,
    saveUninitialized: false,
    rolling: true,
    secret: process.env.SESSION_SECRET
}));

module.exports = app;