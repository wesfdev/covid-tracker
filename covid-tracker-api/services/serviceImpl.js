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
    let statusActive = 4;

    let sqlPerson = `INSERT INTO covid_tracker.person (name, age, gender) VALUES(?,?,?);`;
    let sqlDiagnostic = `INSERT INTO covid_tracker.diagnostic(person, city, status, token, creation_date) VALUES(?,?,?,?,?);`;
    let sqlCondition = `INSERT INTO covid_tracker.patient_condition(diagnostic, type_job, type_contact_work, risk_area, positive_person_contact) VALUES(?, ?, ?, ?, ?)`;
    let sqlDiagnosticDet = `INSERT INTO covid_tracker.diagnostic_detail(diagnostic, symptom_response) VALUES(?, ?)`;

    try {
        let resultPerson  = await insert(sqlPerson,[diagnostic.name,  diagnostic.age, diagnostic.gender.dbid]);
        let resultDiagnostic  = await insert(sqlDiagnostic, [resultPerson.insertId, diagnostic.city, statusActive, token, showTime()]);
        await insert(sqlCondition, [resultDiagnostic.insertId, diagnostic.typeJob.dbid, diagnostic.typeContact.dbid, diagnostic.riskArea, diagnostic.typeContactWork]);
    
        for(let i = 0; i < detail.length; i++){
            await insert(sqlDiagnosticDet, [ resultDiagnostic.insertId, detail[i].dbid ]);
        }
    
        let probability = await virusProbability(resultDiagnostic.insertId);
        let condition = getCondition(diagnostic, probability[0].weighing);
        let resumen = await resumenByProbability(probability[0].weighing);
        let resumenProbability = getRiskObservation(resumen, condition.risk);
        let observations = await getObservations();
        let type = getType(condition.percent);

        return { 
            token,
            diagnostic: resultDiagnostic.insertId,
            type,
            resumenProbability,
            observations
        };        
    } catch (error) {
        console.log('Error persist saveDiagnostic', error)
        return new Error(`Error persist : ${error.message}`)
    }

}

let getType = (percent) => {
    if(percent >= 0 && percent <= 6){
        return 'A';
    }else if(percent >= 7 && percent <= 12){
        return 'B';
    }else{
        return 'C';
    }
}

let getCondition = (diagnostic, percent) =>{
    let risk = 0;

    if(diagnostic.riskArea > 0){
        risk+=4;
    }

    if(diagnostic.typeContactWork > 0){
        risk+=5;
    }    

    return {
        percent: percent + risk,
        risk: risk
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

let resumenByProbability = async (percent) =>{
    let sql = `
    select cat.description as categoryName, o.dbid, o.description
        from covid_tracker.observations o 
        inner join covid_tracker.value_list cat on cat.dbid = o.category
        inner join covid_tracker.value_list sts on sts.dbid = o.status    
        where cat.name in('resumen','forms_communication')
        and ? BETWEEN o.initial_probability and o.final_probability_range
        and sts.name = 'active' ;
    `;
    let db = connection.promise();
    let [ rows ]  = await db.execute(sql,[percent]);
    let groups = _.chain(rows)
    .groupBy('categoryName')
    .value();

    return groups;    
}

let getRiskObservation = (array, value) =>{

    if(value > 0){
        let type = '0.Condiciones de riesgo';
        array[type] = [
            {
                dbid:1,                
                categoryName:type,
                description: 'Debido a las condiciones de riesgo a las que ha sido expuesto, se le recomienda que informe a su médico de su sospecha de tener COVID-19, si se le aconseja ir a un centro de emergencia o los centro establecidos, por favor utilice mascarilla para minimizar la probabilidad de contagiar a otros.'
            }
        ];
        return array;
    }
    return array;
}

let getObservations = async () =>{
    let sql = `
        select cat.dbid categoryDbid, cat.name as categoryname, 
        cat.description as categoryDescription, o.description
        from covid_tracker.observations o
        inner join covid_tracker.value_list cat on cat.dbid = o.category
        inner join covid_tracker.value_list sts on sts.dbid = o.status
        where cat.name not in('resumen','forms_communication')
    and sts.name = 'active';
    `;
    let db = connection.promise();
    let [ rows ]  = await db.execute(sql);

    let groups = _.chain(rows)
    .groupBy('categoryDescription')
    .value();

    return groups;      
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
    getDiagnosticsByCity,
    getObservations
}