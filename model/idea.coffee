# 对提交创意的数据操作
# 插入数据到数据库，读取数据库中的数据
# 2015.6.9
mysql = require 'mysql';
conts = require '../constants'
conn = mysql.createConnection
    host: conts.db.host,
    user: conts.db.username,
    password: conts.db.password,
    database: conts.db.database,
    port: conts.db.port

conn.connect()

insertIdea = (idcard, title, content, externalurl, pictureid, publishtime, worker) ->
	insertSQL = "insert into submission(idcard, title, content, externalurl, pictureid, publishtime, worker, is) 
					values('#{idcard}', '#{title}', '#{content}', '#{externalurl}', '#{pictureid}', '#{publishtime}', '#{worker}', '1')"
	conn.query insertSQL,
	(err,res) ->
		if err
			console.log err
		console.log res

readIdea = (callback)->
	selectSQL = "select * from submission 
					order by publishtime"
	conn.query selectSQL,
	(err,res) ->
		if err
			console.log err
		console.log res
		callback res

conn.end()

moudle.exports = 
	insertIdea: insertIdea,
	readIdea: readIdea