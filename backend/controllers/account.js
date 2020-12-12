import { getUsers, getUserById } from "../models/accountModel.js";

export const showUsers = (req,res) => {
    getUsers((err, results) => {
        if (err) {
            res.send(err);
        }else {
            res.json(results)
        }
    })
}

export const showUserById = (req,res)=>{
    getUserById(req.params.id, (err, results) =>{
        if (err) throw err;
        if (results.length > 0){
            res.json(results);
        }
    })
}

