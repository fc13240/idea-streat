# 文件处理与存储
mysql = require 'mysql';
conts = require '../constants'
conn = mysql.createConnection
    host: conts.db.host,
    user: conts.db.username,
    password: conts.db.password,
    database: conts.db.database,
    port: conts.db.port

conn.connect()

save = (files,callback) ->
	co = 
		counts : 0,
		data : []
	for file in files
		co.counts += 1
		content = files[file]
		insertSQL = "insert into pictures(pictureid, address) values('#{content.name}', '#{content.url}')"
		conn.query insertSQL, (err,res) ->
			if err
				console.log err
			console.log res
			callback res
get = (pictureid,callback) ->
	
	