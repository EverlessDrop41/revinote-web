module.exports = function (app) {
	app.get('/login', must_not_be_logged_in,function (req, res) {
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

	app.get('/sign_up', must_not_be_logged_in,function (req, res) {
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

	app.get('/user_settings', must_be_logged_in, function (req, res) {
		var s = req.session.successes;
		req.session.successes = null;
		console.log(s);
		res.render('user_settings', {user: req.session.user, successes: s});
	});

	app.post('/user_settings/change_email', must_be_logged_in, function (req, res) {
		app.locals.fireref.changeEmail({
		  oldEmail : req.session.user.email,
		  newEmail : req.body.new_email,
		  password : req.body.pass
		}, function(error) {
		  if (error === null) {
		  	req.session.user.email = req.body.new_email;
		  	req.session.successes ? req.session.successes.push("Successfully changed email") : req.session.successes = ["Successfully changed email"];
		    res.redirect('/user_settings');
		  } else {
		    console.log("Error changing email:", error);
		    req.session.dangers ? req.session.dangers.push("Error changing email") : req.session.dangers = ["Error changing email"];
		    res.redirect('/user_settings');
		  }
		});
	});

	app.post('/user_settings/change_password', must_be_logged_in, function (req, res) {
		app.locals.fireref.changePassword({
		  email       : req.session.user.email,
		  oldPassword : req.body.old_pass,
		  newPassword : req.body.new_pass
		}, function(error) {
		  if (error === null) {
		  	req.session.successes ? req.session.successes.push("Successfully changed password") : req.session.successes = ["Successfully changed password"];
		    res.redirect('/user_settings');
		  } else {
		    console.log("Error changing password:", error);
		    res.redirect('/user_settings');
		  }
		});
	});
};

function must_be_logged_in(req, res, next) {
	if (req.session.user) {
		next();
	} else {
		res.redirect('/');
	}
}

function must_not_be_logged_in(req, res, next) {
	if (!req.session.user) {
		next();
	} else {
		res.redirect('/');
	}
}