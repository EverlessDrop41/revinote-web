module.exports = function (app) {
	app.get('/subjects/:subject', must_be_logged_in, function (req, res) {
		res.render('posts/notes-list.swig', { user: req.session.user, 
			subject: req.params.subject.toLowerCase(), breadcrumb: [
				{ name: 'Home' , url: '/' },
				{ name: "Subjects", url: '/subjects'},
				{ name: req.params.subject.capitalize(), isActive: true}
			],
			md_editor: true });
	});

	app.get('/subjects/:subject/:noteid', must_be_logged_in, function (req, res) {
		res.render('posts/note.swig', { 
			user: req.session.user, 
			subject: req.params.subject.toLowerCase(), 
			noteId: req.params.noteid,
			breadcrumb: [
				{ name: 'Home' , url: '/' },
				{ name: "Subjects", url: '/subjects'},
				{ name: req.params.subject.capitalize(), url: '/subjects/' + req.params.subject },
				{ name: req.params.noteid, isActive: true}
			],
			md_editor: true
		});
	});

	app.get('/post-help', function (req, res) {
		res.render('post-help.swig', { user: req.session.user, breadcrumb: [
				{ name: 'Home' , url: '/' },
				{ name: "Post Help", isActive: true}
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