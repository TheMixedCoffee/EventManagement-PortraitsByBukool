//import connection
import db from "../config/database.js";

export const getContacts = (result) => {
    db.query("SELECT * FROM contact", (err, results) => {
        if(err) throw err;
        if(results.length > 0){
            result(null, results)
        }
    })
}

export const getContactById = (id, result) =>{
    db.query("SELECT * FROM contact WHERE id = ?", [id], (err, results)=>{
        if (err) {
            throw err
        }else{
            result(null, results[0]);
        }
    });
}

export const getContactNumbers = (id, result) =>{
    db.query("SELECT * FROM contact_number WHERE contact_id = ?", [id], (err, results)=> {
        if (err) {
            throw err;
        } else {
            result(null, results);
        }
    })
}

export const insertContact = (data, result) => {
    db.query(`INSERT INTO contact (contact_name, contact_number, contact_desc) VALUES (
        "${data.contact_name}", '${data.contact_number}', "${data.contact_desc}")`, (err, results)=> {
        if (err) {
            throw err;
        } else {
            result(null, results);
        }
    });
}

export const updateContactById = (data, id, result) => {
    db.query(`UPDATE contact SET contact_name = '${data.contact_name}', contact_description = '${data.contact_desc}', 
        contact_number = '${data.contact_number}' WHERE id = ${id}`, 
        (err, results) => {
            if (err) {
                throw err;
            } else {
                result(null, results);
            }
        })
}

export const deleteContactById = (id, result) => {
    db.query(`DELETE FROM contact WHERE id = ${id}`, (err, results) => {
        if (err) {
            throw err;
        } else {
            result(null, results);
        }
    })
}