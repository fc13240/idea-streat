# 周五佳的评定与录入
mysql = require 'mysql';
conts = require '../constants'
conn = mysql.createConnection
    host: conts.db.host,
    user: conts.db.username,
    password: conts.db.password,
    database: conts.db.database,
    port: conts.db.port

conn.connect()

selectFive = (time,callback) ->
	selectSQL = "select idcard from 
					(select * from support where idcard in 
						(select idcard from submission
							where date(publishtime) < date('#{time}')) 
					order by number) limit 5"
	conn.query selectSQL, (err,res) ->
		if err
			console.log err
		console.log res
		callback res

saveFive = (idcard,time) ->
	insertSQL = "insert into fivegood(idcard, time) values('#{idcard}', '#{time}')"
	conn.query insertSQL,(err,res)->
		if err
			console.log err
		console.log res

readFive = (time,callback) ->
	selectSQL = "select * from submission where idcard in
					(select idcard from fivegood 
						where time='#{time}')"
	conn.query selectSQL,(err,res) ->
		if err
			console.log err
		console.log res
		callback res

conn.end()
moudle.exports =
	selectFive: selectFive,
	saveFive: saveFive,
	readFive: readFive