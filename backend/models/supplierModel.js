import db from '../config/database.js'

export const getSuppliers = (result) => {
    db.query(`SELECT * FROM supplier`, (err, results) => {
        if (err) {
            throw err;
        } else {
            result(null, results);
        }
    })
}

export const getSupplierById = (id, result) => {
    db.query(`SELECT * FROM supplier WHERE id = ${id}`, (err, results) => {
        if (err) {
            throw err;
        } else {
            result(null, results[0]);
        }
    })
}

export const insertSupplier = (data, result) => {
    db.query("INSERT INTO supplier SET ?", [data], (err, results) => {
        if (err) {
            throw err;
        } else {
            result(null, results);
        }
    })
}