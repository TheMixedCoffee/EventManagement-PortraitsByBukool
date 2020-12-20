import db from '../config/database.js'

export const getServices = (result) => {
    db.query("SELECT * FROM service", (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            result(null, results);
        }
    })
}

export const getServiceById = (id, result) => {
    db.query("SELECT * FROM service WHERE id = ?", [id], (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            result(null, results[0]);
        }
    })
}

export const insertService = (data, result) => {
    db.query("INSERT INTO service SET ?", [data], (err, results)=> {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
}

export const updateServiceById = (data, id, result) => {
    db.query(`UPDATE service SET name = '${data.name}', description = '${data.description}', 
        price = '${data.price}', event_type_id = '${data.event_type_id}' WHERE id = ${id}`, 
        (err, results) => {
            if (err) {
                throw err;
            } else {
                result(null, results);
            }
        })
}

export const deleteServiceById = (id, result) => {
    db.query("DELETE FROM service WHERE id = ?", [id], (err, results) => {
        if (err) {
            throw err;
        } else {
            result(null, results);
        }
    })
}