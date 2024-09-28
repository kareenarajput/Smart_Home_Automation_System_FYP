const express = require('express');
const body_parser = require('body-parser');
const router = require('./routers');

const app = express();
app.use(body_parser.json());
app.use('/', router);

module.exports = app;