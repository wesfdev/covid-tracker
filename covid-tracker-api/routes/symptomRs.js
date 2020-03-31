const express = require('express');
const app = express();

const resource = 'symptom'
const version = 'v1';
const { 
        getSymptoms
    } = require('../services/symptomImpl')




app.get(`/${version}/${resource}`, async function (req, res) {
    let response = await getSymptoms();
    
    return res.status(200).json({
        code: 0,
        metadata: {},
        message: "Get symptom list",
        body: response
    });
});


module.exports = app;