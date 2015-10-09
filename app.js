//Emily Peregrine - 9/10/2015
var express = require('express');
var body_parser = require('body-parser');
var swig = require('swig');
var Firebase = require("firebase");
var app = express();

//FOR DEBUGGING
app.set('view cache', false);
swig.setDefaults({ cache: false });

app.engine('swig', swig.renderFile);

app.set('view engine', 'swig');
app.set('views', __dirname + '/templates');

app.use(express.static('public'));

//Put firebase into app locals
var myFirebaseRef = new Firebase('https://revinote.firebaseio.com/');

//Refactor requests
app.use(body_parser.urlencoded({
	extended: false
}));

//Check for domain from command line
var domain = "localhost";
process.argv.forEach(function (val, index, array) {
  if (index.toLowerCase() == 'domain') {
  	domain = val;
  }
});

//Log all requests
app.use(function (request, res, next) {
	console.log(request.method + request.url);
	next();
});

app.get('/', function (req, res) {
  res.send('Hello World!');
});

var server = app.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});