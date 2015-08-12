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
insertSQL = 'insert into t_user (name) values "conan"), "fens.me")'
selectSQL = 'select * from t_user limit 10'
deleteSQL = 'delete from t_user'
updateSQL = 'update t_user set name="conan update"  where name="conan"'

# delete
conn.query deleteSQL,  err0, res0 ->
    if err0 
    	console.log err0
    console.log "DELETE Return ==> "
    console.log res0

    # insert
    conn.query insertSQL, (err1, res1) ->
        if  err1 
        	console.log err1
        console.log "INSERT Return ==> "
        console.log res1

        # query
        conn.query selectSQL, (err2, rows) ->
            if  err2 
            	console.log err2
            console.log "SELECT ==> "
            for i in rows 
                console.log rows[i]

            # update
            conn.query updateSQL, (err3, res3) ->
                if  err3 
                	console.log err3
                console.log "UPDATE Return ==> "
                console.log res3

                # query
                conn.query selectSQL, (err4, rows2) ->
                    if  err4 
                    	console.log err4
                    console.log "SELECT ==> "
                    for i in rows2 
                        console.log rows2[i]

conn.end()