const mysql = require('mysql');

const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_DATABASE
})

db.on("connect", () => {
    db.query("USE dnd_en;")
    console.log("DB successfuly connected.");
})

module.exports = db;