import { getAllEventTypes, getEventTypeById, insertEventType } from '../models/eventTypeModel.js'

export const showAllEventTypes = (req,res) => {
    getAllEventTypes((err, results) => {
        if (err) {
            res.send(err);
        } else {
            res.json(results);
        }
    })
}

export const showEventTypeById = (req,res) => {
    getEventTypeById(req.body.id, (err, results) => {
        if (err) {
            res.send(err);
        } else {
            res.json(results);
        }
    })
}

export const createEventType = (req, res) => {
    const data = req.body;
    insertEventType(data, (err, results) => {
        if (err) throw err;
        else {
            res.json(results);
        }
    })
}