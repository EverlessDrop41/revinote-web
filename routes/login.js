module.exports = function (app) {
	app.get('/login', function (req, res) {
		res.render('login', {signup: false});
	});

	app.post('/login', function (req, res) {
		console.log(req.body.email);
		console.log(req.body.password);
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