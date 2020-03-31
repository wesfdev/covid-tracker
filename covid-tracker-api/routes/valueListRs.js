const express = require('express');
const app = express();

const resource = 'value-list'
const version = 'v1';
const { 
        getValueList, 
        getValueListByDiscriminator, 
        getValueListByDiscriminatorAndName 
    } = require('../services/valueListImpl')

app.get(`/${version}/${resource}`, async function (req, res) {
    let response = await getValueList();
    
    return res.status(200).json({
        code: 0,
        metadata: {},
        message: "Get value list",
        body: response
    });
});


app.get(`/${version}/${resource}/discriminator/:discriminator`, async function (req, res) {
    let discriminator = req.params.discriminator;
    let response = await getValueListByDiscriminator(discriminator);

    return res.status(200).json({
        code: 0,
        metadata: {},
        message: "Get value list by discriminator",
        body: response
    });
});


app.get(`/${version}/${resource}/discriminator/:discriminator/name/:name`, async function (req, res) {
    let discriminator = req.params.discriminator;
    let name = req.params.name;
    let response = await getValueListByDiscriminatorAndName(discriminator, name);

    return res.status(200).json({
        code: 0,
        metadata: {},
        message: "Get value list by discriminator and name",
        body: response
    });
});
   

module.exports = app;