const express = require('express');
const mysql = require('mysql');
const app = express();
const port = 3000;
const mysql_host = process.env.MYSQL_HOST;
const mysql_db = process.env.MYSQL_DB;
const mysql_user = process.env.MYSQL_USER;
const mysql_pass = process.env.MYSQL_PASS;


// create connection to database
const db = mysql.createConnection ({
    host: mysql_host,
    user: mysql_user,
    password: mysql_pass,
    database: mysql_db
});

// configure middleware
app.set('port', process.env.port || port); // set express to use this port

// Connect to database
db.connect();

// Fetch records and show page on every request to /
app.get('/', function (req, res) {

  db.query('SELECT message FROM content', function(err, rows, fields)
  {
      if (err) throw err;

      res.send(rows[0].message + "<br><br>environment: " + process.env.NODE_ENV);

  });
});


app.listen(port, () => console.log(`Application listening at http://localhost:${port}`))
