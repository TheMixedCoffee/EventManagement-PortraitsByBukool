import { getSupplierById, getSuppliers, insertSupplier } from '../models/supplierModel.js'

export const showSuppliers = (req,res) => {
    getSuppliers((err, results) => {
        if (err) {
            res.send(err);
        } else {
            res.json(results);
        }
    })
}

export const showSupplierById = (req,res) => {
    getSupplierById(req.params.id, (err, results) => {
        if (err) {
            res.send(err);
        } else {
            res.json(results);
        }
    })
}

export const createSupplier = (req,res) => {
    insertSupplier(req.body, (err, results) => {
        if (err) {
            throw err;
        } else {
            res.json(results);
        }
    })
}