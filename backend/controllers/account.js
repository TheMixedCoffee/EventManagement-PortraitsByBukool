import { getUserById } from "../models/accountModel.js";

export const showUser = (req,res)=>{
    getUserById((err, results) =>{
        if (err) throw err;
        if (results.length > 0){
            res.json(results);
        }
    })
}

