// Generated by CoffeeScript 1.9.3
var conn, conts, mysql, readFive, saveFive, selectFive;

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

selectFive = function(time, callback) {
  var selectSQL;
  selectSQL = "select idcard from (select * from support where idcard in (select idcard from submission where date(publishtime) < date('" + time + "')) order by number) limit 5";
  return conn.query(selectSQL, function(err, res) {
    if (err) {
      console.log(err);
    }
    console.log(res);
    return callback(res);
  });
};

saveFive = function(idcard, time) {
  var insertSQL;
  insertSQL = "insert into fivegood(idcard, time) values('" + idcard + "', '" + time + "')";
  return conn.query(insertSQL, function(err, res) {
    if (err) {
      console.log(err);
    }
    return console.log(res);
  });
};

readFive = function(time, callback) {
  var selectSQL;
  selectSQL = "select * from submission where idcard in (select idcard from fivegood where time='" + time + "')";
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
  selectFive: selectFive,
  saveFive: saveFive,
  readFive: readFive
};
