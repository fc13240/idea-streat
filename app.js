var express = require('express');
var debug = require('./debug');
var consts = require('./constants');

var path = require('path');
var cookieParser = require('cookie-parser');
var session = require('express-session');
var bodyParser = require('body-parser');
var logger = require('morgan');
var serveStatic = require('serve-static');
var multer = require('multer');

var app = express();

app.set('views','./views');

app.use(logger('dev'));

app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
app.use(multer({
	dest: consts.app.files,
	limits: {
		fileSize: 1024*1024*32 //32MB maxmium
	}
}));
app.use(cookieParser());

app.use(function(req,res,next){
	res.sendf=function(file,type,callback){
		res.sendFile(file,{
			root: './uploadedfiles',
			headers: {
				'Content-Type': type
			}
		},callback);
	};
	next();
});


app.post(function(req,res,next){
	console.log(req.body);
	next();
});

app.use('/static',serveStatic('./view/static'));
app.use('/ajax',ajaxHoster);
app.use('/dynamic',dynamicAssetsRouter);
app.use('/manage',manager);
app.use('/',pageRender);

app.use(function(req, res, next){
	var err = new Error('Not Found');
	err.status = 404;
	next(err);
});

app.use(function(err,req,res,next){
	res.status(err.status || 500);
	res.render('error', {
		message: err.message,
		error: err
	});
});

module.exports = app;