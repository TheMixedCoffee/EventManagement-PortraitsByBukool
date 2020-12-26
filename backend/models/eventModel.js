import db from '../config/database.js'

export const getAllEvents = (result) => {
    db.query("SELECT * FROM event", (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            result(null, results);
        }
    })
}

export const getEventByAccountId = (account_id, result) => {
    db.query("SELECT * FROM event WHERE account_id = ?", [account_id], (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            result(null, results);
        }
    })
}

export const getEventByEmployeeId = (employee_id, result) => {
    db.query("SELECT * FROM event WHERE employee_id = ?", [employee_id], (err, results) => {
        if (err) throw err;
        if(results.length > 0) {
            result(null, results);
        }
    })
}

export const getEventById = (id, result) => {
    db.query("SELECT * FROM event WHERE id = ?", [id], (err, results) => {
        if (err) {
            throw err;
        } else {
            result(null, results[0]);
        }
    })
}

export const insertEvent = (data, result) => {
    db.query("INSERT INTO event SET ?", [data], (err, results)=> {
        if (err) throw err;
        else {
            result(null, results);
        }
    });
}