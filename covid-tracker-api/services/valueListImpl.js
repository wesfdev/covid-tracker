const { connection } = require('../config/connection')
const base_query = 'select * from covid_tracker.value_list';



let getValueList = async () => {
    let db = connection.promise();
    let [rows]  = await db.execute(base_query);
    return rows;
}

let getValueListByDiscriminator = async (discriminator) => {
    let db = connection.promise();
    let [rows]  = await db.execute(`${base_query} where discriminator = ?`, [ discriminator ]);
    return rows;    
 
}

let getValueListByDiscriminatorAndName = async (discriminator, name) => {
    let db = connection.promise();
    let [rows]  = await db.execute(`${base_query} where discriminator = ? and name = ?`, [ discriminator, name ]);
    return rows;
}

module.exports = {
    getValueList,
    getValueListByDiscriminator,
    getValueListByDiscriminatorAndName
}