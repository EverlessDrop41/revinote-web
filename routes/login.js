module.exports = function (app) {
	app.get('/login', function (req, res) {
		if (req.session.user) {
			res.redirect('/');
		}
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
		    res.render('login', {signup: false});
		  } else {
		  	req.session.user = { uid: authData.uid, token: authData.token , email: req.body.email }
		    res.redirect('/');
		  }
		}, { remember: 'none'});
	});

	app.get('/sign_up', function (req, res) {
		if (req.session.user) {
			res.redirect('/');
		}
		res.render('login', {signup: true});
	});

	app.post('/sign_up', function (req, res) {
		console.log(req.body.email);
		console.log(req.body.password);
		app.locals.fireref.createUser({
		  email    : req.body.email,
		  password : req.body.password
		}, function(error, userData) {
		  if (error) {
		    res.redirect('sign_up');
		  } else {
		    res.redirect('login');
		  }
		});
	});

	app.get('/logout', function (req, res) {
		req.session.user = null;
		res.redirect('/login');
	});
};