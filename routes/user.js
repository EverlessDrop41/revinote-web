module.exports = function (app) {
	app.get('/login', must_not_be_logged_in,function (req, res) {
		var s = req.session.successes;
		var d = req.session.dangers;
		req.session.successes = null;
		req.session.dangers = null;
		res.render('login', {signup: false, breadcrumb: [
				{ name: 'Home' , url: '/'},
				{ name: 'Login', isActive: true}
			], successes: s, dangers: d });
	});

	app.post('/login', function (req, res) {
		console.log(req.body.email);
		console.log(req.body.password);
		app.locals.fireref.authWithPassword({
		  email    : req.body.email,
		  password : req.body.password,
		}, function(error, authData) {
		  if (error) {
		  	req.session.dangers ? req.session.dangers.push("Error signing in: " + error.message) : req.session.dangers = ["Error signing in: " + error.message];
		    res.redirect('login');
		  } else {
		  	req.session.user = { uid: authData.uid, token: authData.token , email: req.body.email }
		    res.redirect('/');
		  }
		}, { remember: 'none'});
	});

	app.get('/sign_up', must_not_be_logged_in,function (req, res) {
		var s = req.session.successes;
		var d = req.session.dangers;
		req.session.successes = null;
		req.session.dangers = null;
			res.render('login', {signup: true, breadcrumb: [
				{ name: 'Home' , url: '/'},
				{ name: 'Sign Up', isActive: true}
			], successes: s, dangers: d });
	});

	app.post('/sign_up', function (req, res) {
		console.log(req.body.email);
		console.log(req.body.password);
		app.locals.fireref.createUser({
		  email    : req.body.email,
		  password : req.body.password
		}, function(error, userData) {
		  if (error) {
		  	req.session.dangers ? req.session.dangers.push("Error signing up: " + error.message) : req.session.dangers = ["Error signing up: " + error.message];
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
		var d = req.session.dangers;
		req.session.successes = null;
		req.session.dangers = null;
		console.log(s);
		res.render('user_settings', {user: req.session.user, successes: s, dangers: d, breadcrumb: [
				{ name: 'Home' , url: '/'},
				{ name: 'User Settings', isActive: true}
			] });
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
		    console.log(error.code);
		    req.session.dangers ? req.session.dangers.push("Error changing email " + error.message) : req.session.dangers = ["Error changing email " + error.message];
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
		    console.log("Error changing password: " , error.message);
		    req.session.dangers ? req.session.dangers.push("Error changing password: " + error.message) : req.session.dangers = ["Error changing password: " + error.message];
		    res.redirect('/user_settings');
		  }
		});
	});

	app.post('/user_settings/delete_user', must_be_logged_in, function (req, res) {
		app.locals.fireref.removeUser({
		  email    : req.session.user.email,
		  password : req.body.pass
		}, function(error) {
		  if (error === null) {
		  	req.user = null;
		    res.redirect("/")
		  } else {
		    console.log("Error changing password: " , error.message);
		    req.session.dangers ? req.session.dangers.push("Error deleting account: " + error.message) : req.session.dangers = ["Error deleting account: " + error.message];
		    res.redirect('/user_settings');
		  }
		});
	});

	app.get('/reset_password', function (req, res) {
		res.render('reset_password', { breadcrumb: [
				{ name: 'Home' , url: '/'},
				{ name: 'Forgot Password', isActive: true}
			] });
	});

	app.post('/reset_password', function (req, res) {
		app.locals.fireref.resetPassword({
		  email : req.body.email
		}, function(error) {
		  if (error === null) {
		    res.render('reset_password', { successes: ["Successfully sent password rest email to: " + req.body.email]});
		  } else {
		    res.render('reset_password', { dangers: ["Didn't successfully send password rest email to: " + req.body.email + ". Error: " + error.message], autoescape: false});
		  }
		});
	});
};

function must_be_logged_in(req, res, next) {
	if (req.session.user) {
		next();
	} else {
		res.redirect('/login');
	}
}

function must_not_be_logged_in(req, res, next) {
	if (!req.session.user) {
		next();
	} else {
		res.redirect('/');
	}
}