import { getUsers, getUserById, insertUser, checkUser } from "../models/accountModel.js";

import session from "express-session";
import bcrypt from "bcrypt";
import { saltRounds }  from '../app.js';

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
        if (err) {
            throw err;
        } else {
            res.json(results);
        }
    })
}

export const createUser = (req, res) => {
    let salt = bcrypt.genSaltSync(saltRounds);
    let hash = bcrypt.hashSync(req.body.password, salt);
    req.body.password = hash;
    const data = req.body;
    insertUser(data, (err, results) => {
        if (err) throw err;
        else {
            res.json(results);
        }
    })
}

export const authUser = (req, res) => {
    checkUser(req.body.username, (err, results) => {
        if (err) throw err;
        if (bcrypt.compareSync(req.body.password, results.password)) {
            req.session.isloggedin = true;
            req.session.username = req.body.username;
            res.json(results);
        }
    })
}