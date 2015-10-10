module.exports = function (app) {
	app.get('/login', function (req, res) {
		res.render('login', {signup: false});
	});

	app.post('/login', function (req, res) {
		console.log(req.body.email);
		console.log(req.body.password);
		app.locals.fireref.authWithPassword({
		  email    : req.body.email,
		  password : req.body.password,
		}, function(error, authData) {
		  if (error) {
		    console.log("Login Failed!", error);
		  } else {
		    console.log("Authenticated successfully with payload:", authData);
		    req.sesssion.uid = authData.uid;
		    req.sesssion.token = authData.token;
		    req.sesssion.email = req.body.email;
		  }
		}, { remember: 'none'});
		res.render('login', {signup: false});
	});

	app.get('/sign_up', function (req, res) {
		res.render('login', {signup: true});
	});

	app.post('/sign_up', function (req, res) {
		console.log(req.body.email);
		console.log(req.body.password);
		res.redirect('login');
	});
};