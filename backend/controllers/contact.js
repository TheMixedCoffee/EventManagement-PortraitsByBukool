import {getContacts, getContactById, getContactNumbers, insertContact, updateContactById, deleteContactById} from "../models/contactModel.js";

export const showContacts = (req,res)=>{
    getContacts((err, results)=>{
        if (err) throw err;
        else{
            res.json(results);
        }
    })
}

export const showContactById = (req,res)=>{
    getContactById(req.params.id, (err,results)=>{
        if (err) throw err;
        else{
            res.json(results);
        }
    })
}

export const showContactNumbers = (req,res)=>{
    getContactNumbers(req.params.id, (err,results)=>{
        if (err) throw err;
        else{
            res.json(results);
        }
    })
}

export const createContact = (req,res)=>{
    const data = req.body;
    insertContact(data, (err,results)=>{
        if (err) throw err;
        else{
            res.json(results);
        }
    })
}

export const updateContact = (req,res)=>{
    const data = req.body;
    const id = req.params.id;
    updateContactById(data, id, (err, results)=>{
        if (err) throw err;
        else{
            res.json(results);
        }
    })
}

export const deleteContact = (req,res) =>{
    deleteContactById(req.params.id, (err, results) =>{
        if(err) throw err;
        else{
            res.json(results);
        }
    })
}