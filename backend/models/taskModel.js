import db from '../config/database.js'

export const getTasksByEventId = (id, result) => {
    db.query(`SELECT * FROM tasks WHERE event_id = ?`, [id], (err, results) => {
        if (err) throw err;
        else {
            result(null, results);
        }
    })
}

export const getTaskById = (id, result) => {
    db.query(`SELECT * FROM tasks WHERE id = ${id}`, (err, results) => {
        if (err) throw err;
        else {
            result(null, results[0]);
        }
    })
}

export const insertTask = (data, result) => {
    db.query("INSERT INTO tasks SET ?", [data], (err, results) => {
        db.query(`INSERT INTO assigned_event SET event_id = "${data.event_id}", employee_id = "${data.employee_id}"`, 
        (err, results) => {
            if (err) throw err;
            else {
                result(null, results);
            }
        })
    })
}

export const updateTaskStatus = (status, id, result) =>{
    db.query(`UPDATE tasks SET status = '${status}' WHERE id = ${id}`, (err, results)=>{
        if (err) throw err;
        else {
            result(null, results);
        }
    })
}

export const getTaskByEmployeeId = (id, result) => {
    db.query(`SELECT * FROM tasks WHERE employee_id = ? && status = 'ongoing' ORDER BY start_date`, [id], (err, results) => {
        if (err) {
            throw err;
        } else {
            result(null, results);
        }
    })
}