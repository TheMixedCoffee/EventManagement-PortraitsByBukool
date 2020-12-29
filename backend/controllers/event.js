import { getAllEvents, getEventByAccountId, getEventByEmployeeId, getEventById, getOngoingEvent, getPendingEvent, getCompletedEvent, updateEventById, insertEvent, getCompletedEventByAccount } from '../models/eventModel.js'

export const showAllEvents = (req,res) => {
    getAllEvents((err, results) => {
        if (err) throw err;
        else {
            res.json(results);
        }
    })
}

export const showEventByAccount = (req,res) => {
    getEventByAccountId(req.params.id, (err, results) => {
        if (err) {
            res.send(err);
        } else {
            res.json(results);
        }
    })
}

export const showEventByEmployee = (req,res) => {
    getEventByEmployeeId(req.body.id, (err, results) => {
        if (err) {
            res.send(err);
        } else {
            res.json(results);
        }
    })
}

export const showEventById = (req,res) => {
    getEventById(req.params.id, (err, results) => {
        if (err) {
            res.send(err);
        } else {
            res.json(results);
        }
    })
}

export const showAllOngoingEvents = (req,res)=>{
    getOngoingEvent((err, results)=>{
        if(err) throw err;
        else{
            res.json(results);
        }
    })
}

export const showAllPendingEvents = (req,res)=>{
    getPendingEvent((err, results)=>{
        if (err) throw err;
        else{
            res.json(results);
        }
    })
}

export const showAllCompletedEvents = (req,res)=>{
    getCompletedEvent((err, results)=>{
        if (err) throw err;
        else{
            res.json(results);
        }
    })
}

export const showCompletedEventsByAccount = (req,res)=>{
    getCompletedEventByAccount(req.params.id, (err, results)=>{
        if (err) throw err;
        else{
            res.json(results);
        }
    })
}

export const createEvent = (req, res) => {
    const data = req.body;
    insertEvent(data, (err, results) => {
        if (err) throw err;
        else {
            res.json(results);
        }
    })
}

export const updateEvent = (req,res)=>{
    const data = req.body;
    const id = req.params.id;
    updateEventById(data, id, (err, results)=>{
        if (err) throw err;
        else{
            res.json(results);
        }
    })
}