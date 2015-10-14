//Emily Peregrine
jQuery(document).ready(function ($) {
	if (uid && FireRef) {
		userBase = FireRef.child(uid);
		subjectBase = userBase.child("subjects");
		
		subjectBase.on("value", function(snap) {
			snap.forEach(function (subject) {
				console.log(subject.val());
			});
		}, function (err) {
			console.error(err.code);
		});

		//subjectBase.push({name: "English",description: "Words 'n Stuff"});
	} else {
		console.error("Uid and/or FireRef not assigned");
	}
});

function Subject (name, description){
	this.name = name;
	this.description = description;
	this.getUrl = function () {
		return "/posts/subjects/" + name;
	}
	this.getData = function () {
		return {name: name, description: description};
	}
}