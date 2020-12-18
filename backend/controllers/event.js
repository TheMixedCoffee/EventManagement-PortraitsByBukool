import e from 'express';
import { getAllEvents, getEventByAccountId, getEventByEmployeeId, getEventById } from '../models/eventModel.js'

export const showAllEvents = (req,res) => {
    getAllEvents((err, results) => {
        if (err) {
            res.send(err);
        } else {
            res.json(results);
        }
    })
}

export const showEventByAccount = (req,res) => {
    getEventByAccountId(req.body.id, (err, results) => {
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