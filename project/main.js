const express = require("express");
const mysql = require("mysql2");
const app = express();

const connection = mysql.createConnection({
    host: "localhost",
    port: 13306,
    user: "root",
    password: "root",
    database: "cats"
});

app.set("view engine", "ejs");

app.use(express.urlencoded({extended: true}));

app.get("/", (req, res) => {
    const q = "SELECT COUNT(*) as count FROM users";
    connection.query(q, (err, results) => {
        console.log(err);
        const count = results[0].count;
        res.render("home", {data: count});   
    })
});

app.post("/register", (req, res) => {
    const user = {email: req.body.email};
    const q = "INSERT INTO users SET ?";
    connection.query(q, user, (err, results) => {
        console.log(err);
        console.log(results);
        res.redirect("/");
    });
});

app.listen(8080, () => {
    console.log("App is listening on port 8080");
});