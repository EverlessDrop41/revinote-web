var marked = require('marked');
marked.setOptions({
  renderer: new marked.Renderer(),
  gfm: true,
  tables: true,
  breaks: true,
  pedantic: true,
  sanitize: true,
  smartLists: true,
  smartypants: true
});

module.exports = function (app) {
	app.get("/formatted_post/:uid/:subject/:noteid", function (req, res) {
		userID = req.params.uid;
		subj = req.params.subject;
		nID = req.params.noteid;

		userRef = app.locals.fireref.child(userID);
		notesRef = userRef.child('notes');
		subjRef = notesRef.child(subj);
		noteRef = subjRef.child(nID);

		noteRef.once("value", function (snap) {
			noteMd = '# ' + snap.val().title + '\n \n' + snap.val().content;
			res.send(marked(noteMd));
		}, function (errorObject) {
		  console.log("The read failed: " + errorObject.code);
		});
	});

	app.get('/md/:uid/:subject/:noteid', function (req, res) {
		userID = req.params.uid;
		subj = req.params.subject;
		nID = req.params.noteid;

		userRef = app.locals.fireref.child(userID);
		notesRef = userRef.child('notes');
		subjRef = notesRef.child(subj);
		noteRef = subjRef.child(nID);

		noteRef.once("value", function (snap) {
			res.set('Content-Type', 'text/plain');
			res.send('# ' + snap.val().title + '\n \n' + snap.val().content);
		}, function (errorObject) {
		  console.log("The read failed: " + errorObject.code);
		});
	});

}