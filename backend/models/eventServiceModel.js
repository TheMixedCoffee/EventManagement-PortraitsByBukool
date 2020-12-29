import db from '../config/database.js'

export const getServiceByEventId = (id, results) =>{
    db.query("SELECT * FROM event_services WHERE event_id = ?", [id], (err, results)=>{
        if (err) throw err;
        if (results.length > 0){
            result(null, results);
        }
    })
}

export const insertEventService = (data, result) => {
    db.query("INSERT INTO event_services SET ?", [data], (err, results)=>{
        if (err) throw err;
        else{
            result(null, results);
        }
    })
}