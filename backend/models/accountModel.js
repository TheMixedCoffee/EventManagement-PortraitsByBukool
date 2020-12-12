//import connection
import db from "../config/database.js";

export const getUserById = (id, result) =>{
    db.query("SELECT * FROM user WHERE id = ?", [id], (err, results)=>{
        if (err) throw err;
        if(results.length > 0){
            result(null, results[0]);
        }
    });
}