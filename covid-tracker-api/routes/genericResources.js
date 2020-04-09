const express = require('express');
const app = express();

const resource = 'resources'
const version = 'v1';
const path = `/${version}/${resource}`;
const { 
        getCities,
        saveDiagnostic,
        getDiagnostics,
        getDiagnosticsByCity,
        getObservations
    } = require('../services/serviceImpl')


app.get(`${path}/cities`, async function (req, res) {
    let response = await getCities();
    return res.status(200).json({
        code: 0,
        metadata: {},
        message: "Get cities list",
        body: response
    });
});


app.post(`${path}/diagnostic`, async function (req, res) {
    let diagnostic = req.body;
    let response = await saveDiagnostic(diagnostic);
    return res.status(200).json({
        code: 0,
        metadata: {},
        message: "Save diagnostic",
        body: response
    });
});

/*app.get(`${path}/observations`, async function (req, res) {
    let response = await getObservations()
    return res.status(200).json({
        code: 0,
        metadata: {},
        message: "get observations",
        body: response
    });
});

app.get(`${path}/diagnostic`, async function (req, res) {
    let response = await getDiagnostics();
    return res.status(200).json({
        code: 0,
        metadata: {},
        message: "get diagnostics",
        body: response
    });
});

app.get(`${path}/city-diagnostic`, async function (req, res) {
    let response = await getDiagnosticsByCity()
    return res.status(200).json({
        code: 0,
        metadata: {},
        message: "get diagnostics by city",
        body: response
    });
});*/


module.exports = app;