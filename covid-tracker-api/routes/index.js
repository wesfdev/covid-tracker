
const express = require('express');
const app = express();

app.use(require('./valueListRs'));
app.use(require('./covidApiRs'));
app.use(require('./symptomRs'));
app.use(require('./genericResources'));

module.exports = app;