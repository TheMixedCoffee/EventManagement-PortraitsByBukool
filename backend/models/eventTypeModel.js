import db from '../config/database.js'

export const getAllEventTypes = (result) => {
    db.query("SELECT * FROM event_type", (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            result(null, results);
        }
    })
}

export const getEventTypeById = (id, result) => {
    db.query("SELECT * FROM event_type WHERE id = ?", [id], (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            result(null, results);
        }
    })
}

export const insertEventType = (data, result) => {
    db.query("INSERT INTO event_type SET ?", [data], (err, results)=>{
        if (err) throw err;
        else{
            result(null, results);
        }
    })
}