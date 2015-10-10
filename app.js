//Emily Peregrine - 9/10/2015
var express = require('express');
var body_parser = require('body-parser');
var swig = require('swig');
var Firebase = require("firebase");
var app = express();
var cookieSession = require('cookie-session');

app.set('trust proxy', 1) ;// trust first proxy

//FOR DEBUGGING - View Cache
app.set('view cache', false);
swig.setDefaults({ cache: false });

//Enabling and configure Swig templating
app.engine('swig', swig.renderFile);
app.set('view engine', 'swig');
app.set('views', __dirname + '/templates');

//Enable session cookies
app.use(cookieSession({
  name: 'session',
  keys: ['key1', 'key2']
}));

app.use(express.static('public'));

//Put firebase into app locals
var fireref = new Firebase('https://revinote.firebaseio.com/');
app.locals.fireref = fireref;

//Refactor requests
app.use(body_parser.urlencoded({
	extended: false
}));

//Check for domain from command line
var domain = "localhost";
process.argv.forEach(function (val, index, array) {
	try {
		if (index.toLowerCase() == 'domain') {
	  	domain = val;
	  }
	} catch (e) {}
});

//Log all requests
app.use(function (request, res, next) {
	console.log(request.method + request.url);
	next();
});

require('./routes/index.js')(app);
require('./routes/login.js')(app);


var server = app.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});