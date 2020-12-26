import { getUsers, getUserById, insertUser, checkUser, checkUserEmail, getEmployees, getAssignEvents, deleteUserById, insertEmployee } from "../models/accountModel.js";

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

export const createEmployee = (req,res) => {
    let salt = bcrypt.genSaltSync(saltRounds);
    let hash = bcrypt.hashSync(req.body.password, salt);
    req.body.password = hash;
    let lower = req.body.firstname.toLowerCase();
    let firstTwoLetters = lower.substring(0, 2);
    let username = firstTwoLetters+req.body.lastname.toLowerCase();
    req.body.username = username;
    const data = req.body;
    insertEmployee(data, (err,results) => {
        if (err) {
            throw err;
        }
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

export const showEmployees = (req,res) => {
    getEmployees((err, results) => {
        if (err) {
            res.send(err);
        } else {
            res.json(results);
        }
    })
}

export const showAssignedEvents = (req,res) => {
    getAssignEvents(req.params.id, (err, results) => {
        if (err) {
            res.send(err);
        } else {
            res.json(results);
        }
    })
}

export const deleteUser = (req,res) => {
    deleteUserById(req.params.id, (err, results) => {
        if (err) {
            res.send(err);
        } else {
            res.json(results);
        }
    })
}

export const showUserByEmail = (req,res) =>{
    checkUserEmail(req.body.email, (err, results)=>{
        if (err) throw err;
        else{
            res.json(results);
        }
    })
}