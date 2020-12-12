import mysql from "mysql2";

//create connection to database
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'bukool_prototype'
});

export default db;