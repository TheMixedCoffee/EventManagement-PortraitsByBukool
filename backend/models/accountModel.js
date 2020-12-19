//import connection
import db from "../config/database.js";

export const getUsers = (result) => {
    db.query("SELECT * FROM user", (err, results) => {
        if(err) throw err;
        if(results.length > 0){
            result(null, results)
        }
    })
}

export const getUserById = (id, result) =>{
    db.query("SELECT * FROM user WHERE id = ?", [id], (err, results)=>{
        if (err) {
            throw err
        }else{
            result(null, results[0]);
        }
    });
}

export const insertUser = (data, result) => {
    db.query(`INSERT INTO user (username, password, firstname, lastname, email, contact, user_type) VALUES (
        "${data.username}", '${data.password}', "${data.firstname}", 
        "${data.lastname}", '${data.email}', ${data.contact}, 'client')`, (err, results)=> {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
}

export const insertEmployee = (data, result) => {
    db.query(`INSERT INTO user (username, password, firstname, lastname, email, contact, user_type, employee_type) VALUES (
        "${data.username}", "${data.password}", "${data.firstname}",
        "${data.lastname}", "${data.email}", "${data.contact}", 
        'employee', "${data.employee_type}")`, (err, results) => {
            if (err) {
                console.log(err);
                result(err, null);
            } else {
                result(null, results);
            }
        })
}

export const checkUser = (username, result) => {
    db.query(`SELECT * FROM user WHERE username = '${username}'`, (err, results) => {
        if(err) {
            throw err;
        } else {
            result(null, results[0]);
        }
    })
}

export const getEmployees = (result) => {
    db.query(`SELECT * FROM user WHERE user_type = 'employee'`, (err, results) => {
        if (err) {
            throw err;
        } else {
            result(null, results);
        }
    })
}

export const getAssignEvents = (id, result) => {
    db.query(`SELECT user.id, assigned_event.event_id, user.firstname, user.lastname, 
        user.employee_type, user.email, user.contact, event.event_name FROM 
        ((assigned_event INNER JOIN user ON assigned_event.employee_id=user.id) 
        INNER JOIN event ON assigned_event.event_id=event.id) WHERE user.id = ?`, [id], (err, results) => {
            if (err) {
                throw err;
            } else if (results.length > 0) {
                result(null, results);
            } else {
                db.query(`SELECT * FROM user WHERE id = ?`, [id], (err,results) => {
                    if (err) {
                        throw err;
                    } else {
                        result(null, results);
                    }
                })
            }
        })
}

export const deleteUserById = (id, result) => {
    db.query(`DELETE FROM user WHERE id = ${id}`, (err, results) => {
        if (err) {
            throw err;
        } else {
            result(null, results);
        }
    })
}