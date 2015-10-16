module.exports = function (app) {
	app.get('/subjects/:subject', must_be_logged_in, function (req, res) {
		res.render('posts/notes-list.swig', { user: req.session.user, subject: req.params.subject.toLowerCase() });
	});

	app.get('/subjects/:subject/:noteid', must_be_logged_in, function (req, res) {
		res.render('posts/note.swig', { 
			user: req.session.user, 
			subject: req.params.subject.toLowerCase(), 
			noteId: req.params.noteid,
			Title: req.params.noteid.toString()
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