import { getServices, getServiceById, insertService, deleteServiceById, updateServiceById } from '../models/serviceModel.js'

export const showServices = (req,res) => {
    getServices((err, results) => {
        if (err) {
            res.send(err);
        } else {
            res.json(results);
        }
    })
}

export const showServiceById = (req,res) => {
    getServiceById(req.params.id, (err, results) => {
        if (err) {
            res.send(err);
        } else {
            res.json(results);
        }
    })
}

export const createService = (req, res) => {
    const data = req.body;
    insertService(data, (err, results) => {
        if (err) throw err;
        else {
            res.json(results);
        }
    })
}

export const updateService = (req,res) => {
    const data = req.body;
    const id = req.params.id;
    updateServiceById(data, id, (err, results) => {
        if (err) {
            res.send(err);
        } else {
            res.json(results);
        }
    })
}

export const deleteService = (req,res) => {
    deleteServiceById(req.params.id, (err, results) => {
        if(err) {
            res.send(err);
        } else {
            res.json(results);
        }
    })
}