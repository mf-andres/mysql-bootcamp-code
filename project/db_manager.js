const { faker } = require('@faker-js/faker');
const mysql = require('mysql2');

const connnection = mysql.createConnection({
    host: "localhost",
    port: 13306,
    user: "root",
    password: "root",
    database: "cats"
});

// const q = "SELECT COUNT(*) FROM users";
// connnection.query(q, (error, results, fields) => {
//     if (error) throw error;
//     console.log(results);
// });

let data = [];
for (let i = 0; i < 500; i++) {
    const user = [faker.internet.email(), faker.date.past()];
    data.push(user);    
}

const q = `INSERT INTO users (email, created_at) VALUES ?`; 
connnection.query(q, [data], (err, results, fields) => {
    if (err) throw err;
    console.log(results);
    console.log(fields);
})

connnection.end();