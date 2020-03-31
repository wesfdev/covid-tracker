const axios = require('axios');
const express = require('express');
const app = express();
const resource = 'covid'
const version = 'v1';
const endpoint = 'https://covid-193.p.rapidapi.com';
const country = 'country';


const config = {
    headers:{
      'Content-Type':  'application/json',
      'x-rapidapi-host':'covid-193.p.rapidapi.com',
      'x-rapidapi-key':'9d6176a3c9msh981a2c7a13141a4p1e7bb1jsnd0a52ae0eaed'
    }
  };
  

app.get(`/${version}/${resource}/history`, async function (req, res) {
    let country = req.query.country;
    let response = await getHistoryByCountry(country);
    
    return res.status(200).json({
        code: 0,
        metadata: {},
        message: "Get value list",
        body: response
    });
});


app.get(`/${version}/${resource}/statistics`, async function (req, res) {
    let country = req.query.country;
    let response = await getStatisticsByCountry(country);
    
    return res.status(200).json({
        code: 0,
        metadata: {},
        message: "Get value list",
        body: response
    });
});




let request = async (resource, param, value) => {
    let url = `${endpoint}/${resource}?${param}=${value}`;
    const response = await axios.get(url, config);
    return response;
}

let getStatisticsByCountry = async (value) => {
    let response = await request('statistics',country,value);
    return response.data;
}

let getHistoryByCountry = async (value) => {
    let response = await request('history',country,value);
    return response.data;
}


module.exports = app;