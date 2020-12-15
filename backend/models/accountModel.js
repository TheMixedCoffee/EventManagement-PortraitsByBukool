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
    db.query("INSERT INTO user SET ?", [data], (err, results)=> {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
}