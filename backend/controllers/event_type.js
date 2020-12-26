import { getAllEventTypes, getEventTypeById } from '../models/eventTypeModel.js'

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