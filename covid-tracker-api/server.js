require('./config/config')

const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const { connectDatabase } = require('./config/connection')

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

//Configuracion global de rutas
app.use(require('./routes/index'));
   
//connection database
//connectDatabase();  

// APP Listen
app.listen(process.env.PORT,()=>{
    console.log('listen port: ', process.env.PORT)
});