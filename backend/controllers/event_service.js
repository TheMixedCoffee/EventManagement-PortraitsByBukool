import { getServiceByEventId, insertEventService } from "../models/eventServiceModel.js"

export const showServiceByEventId = (req,res) => {
    getServiceByEventId(req.params.id, (err, results) => {
        if (err) {
            res.send(err);
        } else {
            res.json(results);
        }
    })
}

export const linkEventService = (req, res) => {
    const data = req.body;
    insertEventService(data, (err, results) => {
        if (err) throw err;
        else {
            res.json(results);
        }
    })
}