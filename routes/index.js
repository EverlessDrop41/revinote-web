module.exports = function (app) {
	app.get('/', function (req, res) {
		res.render('index', { user: req.session.user, breadcrumb: [
				{ name: 'Home' , isActive: true}
			] });
	});
};