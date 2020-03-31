const { connection, insert } = require('../config/connection')
const _ = require('lodash');
const uuid = require('uuid');

let getCities = async () => {
    let db = connection.promise();
    let [ rows ]  = await db.execute('select * from covid_tracker.city');
    return rows;
}

let showTime = () => {
    let timeNow = new Date();
    let hours   = timeNow.getHours();
    let minutes = timeNow.getMinutes();
    let seconds = timeNow.getSeconds();
    let timeString = "" + hours;
    timeString  += ((minutes < 10) ? ":0" : ":") + minutes;
    timeString  += ((seconds < 10) ? ":0" : ":") + seconds;
    timeString = timeNow.toISOString().slice(0,10) + ' '+ timeString;
    return timeString;
  }


let saveDiagnostic = async (request) => {
    let diagnostic = request.diagnostic;
    let detail = request.detail;
    let token = uuid.v4();

    let sqlPerson = `INSERT INTO covid_tracker.person (name, age, gender) VALUES(?,?,?);`;
    let sqlDiagnostic = `INSERT INTO covid_tracker.diagnostic(person, city, status, token, creation_date) VALUES(?,?,?,?,?);`;
    let sqlCondition = `INSERT INTO covid_tracker.patient_condition(diagnostic, type_job, type_contact_work, risk_area, positive_person_contact) VALUES(?, ?, ?, ?, ?)`;
    let sqlDiagnosticDet = `INSERT INTO covid_tracker.diagnostic_detail(diagnostic, symptom_response) VALUES(?, ?)`;


    let resultPerson  = await insert(sqlPerson,[diagnostic.name,  diagnostic.age, diagnostic.gender.dbid]);
    let resultDiagnostic  = await insert(sqlDiagnostic, [resultPerson.insertId, diagnostic.city, 1, token, showTime()]);
    await insert(sqlCondition, [resultDiagnostic.insertId, diagnostic.typeJob.dbid, diagnostic.typeContact.dbid, diagnostic.riskArea, diagnostic.typeContactWork]);

    for(let i = 0; i < detail.length; i++){
        await insert(sqlDiagnosticDet, [ resultDiagnostic.insertId, detail[i].dbid ]);
    }

    let probability = await virusProbability(resultDiagnostic.insertId);
    let observationsSyntom = await recommendationBySyntom(probability[0].weighing);

    return { 
        token,
        diagnostic: resultDiagnostic.insertId,
        probability,
        observationsSyntom

    };
}


let virusProbability = async (diagnostic) =>{
    let sql =`
    select sum(sr.weighing) as weighing from covid_tracker.diagnostic d 
    inner join covid_tracker.diagnostic_detail dd on dd.diagnostic = d.dbid
    inner join covid_tracker.symptom_response sr on sr.dbid = dd.symptom_response
    where d.dbid = ?`;
    let db = connection.promise();
    let [ rows ]  = await db.execute(sql, [diagnostic]);
    return rows;
}

let recommendationBySyntom = async (percent) =>{
    let sql = `
    select o.*, cat.description as categoryName from covid_tracker.observations o 
    inner join covid_tracker.value_list cat on cat.dbid = o.category
    where cat.name in('principal_symptom','other_symptom')
    and ? BETWEEN o.initial_probability and o.final_probability_range`;
    let db = connection.promise();
    let [ rows ]  = await db.execute(sql,[percent]);
    return rows;    
}

let getDiagnostics = async()=>{
    let sql = `
    select 
    d.dbid as diagnosticDbid, CONCAT_WS(' ', p.name, p.last_name) as name, p.age, gender.dbid as genderDbid, gender.description as genderDescription,
    city.dbid as cityDbid, city.name as cityName, city.latitude, city.longitude,
    ( 
        select IFNULL(sum(sr.weighing),0) as weighing from covid_tracker.diagnostic diag 
        inner join covid_tracker.diagnostic_detail diagd on diagd.diagnostic = diag.dbid
        inner join covid_tracker.symptom_response sr on sr.dbid = diagd.symptom_response
        where diag.dbid = d.dbid 
     ) as weighing,
     d.creation_date 
    from covid_tracker.diagnostic d 
        inner join covid_tracker.person p on p.dbid = d.person
        inner join covid_tracker.value_list gender on gender.dbid = p.gender
        inner join covid_tracker.city city on city.dbid = d.city order by d.dbid desc 
    `;

    let db = connection.promise();
    let [ rows ]  = await db.execute(sql);
    return rows;
}

let getDiagnosticsByCity = async()=>{
    let sql = `
    select 
    city.dbid as cityDbid, city.name as cityName, city.latitude, city.longitude,
    count(*) as cases
    from covid_tracker.diagnostic d 
        inner join covid_tracker.person p on p.dbid = d.person
        inner join covid_tracker.value_list gender on gender.dbid = p.gender
        inner join covid_tracker.city city on city.dbid = d.city
    group by city.dbid order by cases desc
    `;

    let db = connection.promise();
    let [ rows ]  = await db.execute(sql);
    return rows;
}

module.exports = {
    getCities,
    saveDiagnostic,
    getDiagnostics,
    getDiagnosticsByCity
}