import { getAllEvents, getEventByAccountId, getEventByEmployeeId, getEventById, insertEvent } from '../models/eventModel.js'

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

export const createEvent = (req, res) => {
    const data = req.body;
    insertEvent(data, (err, results) => {
        if (err) throw err;
        else {
            res.json(results);
        }
    })
}