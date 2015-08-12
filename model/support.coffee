# 
# 点赞数的数据库操作
# 2015.6.13
# 
mysql = require 'mysql';
conts = require '../constants'
conn = mysql.createConnection
    host: conts.db.host,
    user: conts.db.username,
    password: conts.db.password,
    database: conts.db.database,
    port: conts.db.port

conn.connect()

add = (idcard)->
    updateSQL = "update support 
                    set number=number+1  
                    where idcard= '#{idcard}'' "
    conn.query updateSQL,
    (err,res)->
        if err
            console.log err
        console.log res
        callback res

read = (idcard,callback) ->
    selectSQL = "select number from support 
                    where idcard= '#{idcard}'' "
    conn.query selectSQL,
    (err,res) ->
        if err
            console.log err
        console.log res
        callback res

conn.end()
module.exports = 
    add: add,
    read: read,