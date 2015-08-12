// Generated by CoffeeScript 1.9.3
var conn, conts, insertIdea, mysql, readIdea;

mysql = require('mysql');

conts = require('../constants');

conn = mysql.createConnection({
  host: conts.db.host,
  user: conts.db.username,
  password: conts.db.password,
  database: conts.db.database,
  port: conts.db.port
});

conn.connect();

insertIdea = function(idcard, title, content, externalurl, pictureid, publishtime, worker) {
  var insertSQL;
  insertSQL = "insert into submission(idcard, title, content, externalurl, pictureid, publishtime, worker, is) values('" + idcard + "', '" + title + "', '" + content + "', '" + externalurl + "', '" + pictureid + "', '" + publishtime + "', '" + worker + "', '1')";
  return conn.query(insertSQL, function(err, res) {
    if (err) {
      console.log(err);
    }
    return console.log(res);
  });
};

readIdea = function(callback) {
  var selectSQL;
  selectSQL = "select * from submission order by publishtime";
  return conn.query(selectSQL, function(err, res) {
    if (err) {
      console.log(err);
    }
    console.log(res);
    return callback(res);
  });
};

conn.end();

moudle.exports = {
  insertIdea: insertIdea,
  readIdea: readIdea
};
