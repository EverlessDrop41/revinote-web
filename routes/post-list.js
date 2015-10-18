module.exports = function (app) {
	app.get('/subjects', must_be_logged_in, function (req, res) {
		res.render('posts/subjects-list.swig', { user: req.session.user, breadcrumb: [
				{ name: 'Home' , url: '/'},
				{ name: 'Subjects', isActive: true}
			] });
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