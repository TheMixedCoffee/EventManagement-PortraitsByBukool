import { getTaskByEmployeeId, getTaskById, getTasksByEventId, insertTask, updateTaskStatus } from '../models/taskModel.js'

export const showTaskById = (req,res) => {
    getTaskById(req.params.id, (err, results) => {
        if (err) throw err;
        else{
            res.json(results);
        }
    })
}

export const showTasksByEventId = (req,res) => {
    getTasksByEventId(req.params.id, (err, results) => {
        if (err) throw err;
        else{
            res.json(results);
        }
    })
}

export const createTask = (req,res) =>{
    const data = req.body;
    insertTask(data, (err, results)=>{
        if (err) throw err;
        else{
            res.json(results);
        }
    })
}

export const setTaskComplete = (req,res)=>{
    const status = "completed";
    const id = req.params.id;
    updateTaskStatus(status, id, (err, results)=>{
        if (err) throw err;
        else{
            res.json(results);
        }
    })
}

export const showTaskByEmployee = (req,res) => {
    getTaskByEmployeeId(req.params.id, (err, results) => {
        if (err) {
            throw err;
        } else {
            res.json(results);
        }
    })
}