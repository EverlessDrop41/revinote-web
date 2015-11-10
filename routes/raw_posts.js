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

var mjAPI = require("mathjax-node/lib/mj-page");
var jsdom = require("jsdom").jsdom;

mjAPI.config({
  tex2jax: {
		inlineMath: [['$','$']],
		processClass: "mathjax",
		ignoreClass: "no-mathjax"
	}
});

module.exports = function (app) {
	mjAPI.start();

	app.get("/formatted_post/:uid/:subject/:noteid", function (req, res) {
		userID = req.params.uid;
		subj = req.params.subject;
		nID = req.params.noteid;

		userRef = app.locals.fireref.child(userID);
		notesRef = userRef.child('notes');
		subjRef = notesRef.child(subj);
		noteRef = subjRef.child(nID);

		noteRef.once("value", function (snap) {
			try {
				noteMd = "<!DOCTYPE html><html lang='en'><head><title>Formatted Note</title><script src=\"//cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML\"></script></head><body>";
				noteMd += marked('# ' + snap.val().title + '\n \n' + snap.val().content);
				noteMd += "</body></html>";

				noteDcoument = jsdom(noteMd);

				mjAPI.typeset({
				  html: noteDcoument.body.innerHTML,
				  renderer: "NativeMML",
				  inputs: ["TeX"],
				  xmlns: "mml"
				}, function (result) {
			  	"use strict";
				  noteDcoument.body.innerHTML = result.html;
				  var HTML = "<!DOCTYPE html>\n" + noteDcoument.documentElement.outerHTML.replace(/^(\n|\s)*/, "");
			  	res.send(HTML);
				});
			} catch (e) {
				res.send("404 NOT FOUND");
			}
		}, function (errorObject) {
		  console.log("The read failed: " + errorObject.code);
		  res.send("404 NOT FOUND");
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