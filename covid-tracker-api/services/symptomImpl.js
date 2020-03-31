const { connection } = require('../config/connection')
const _ = require('lodash');



let getSymptoms = async () => {
    let db = connection.promise();
    let sql = `
    select s.name as symptomName, cat.description as categoryDescription, sr.*, 
    CONCAT_WS(' ',sr.name, resp.description, sr.description) as responseDescription
                from covid_tracker.symptom s 
                inner join covid_tracker.value_list cat on cat.dbid = s.category
                inner join covid_tracker.symptom_response sr on sr.symptom = s.dbid   
                inner join covid_tracker.value_list resp on resp.dbid = sr.response 
            `;

    let [rows]  = await db.execute(sql);

    let groups = _.chain(rows)
    .groupBy('categoryDescription')
    .mapValues(values => _.chain(values)
        .groupBy('symptomName')
        .value()
    )
    .value()

    return groups;
}


module.exports = {
    getSymptoms
}