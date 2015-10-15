//Emily Peregrine
jQuery(document).ready(function ($) {
	subjList = $("#SubjectList");

	nameBox = $("#name");
	descriptionBox = $("#description");

	if (uid && FireRef) {
		userBase = FireRef.child(uid);
		subjectBase = userBase.child("subjects");
		
		subjectBase.on("value", function(snap) {
			subjList.html('');
			$("#list-loading").show();
			snap.forEach(function (subjSnap) {
				data = subjSnap.val();
				subject = new Subject(data.name, data.description);
				subjList.append(subject.generateHtml());
			});
			$("#list-loading").hide();
		}, function (err) {
			console.error(err.code);
		});

		//subjectBase.push({name: "English",description: "Words 'n Stuff"});
	} else {
		console.error("Uid and/or FireRef not assigned");
	}

	$("#AddSubject").click(function() {
		name = nameBox.val();
		description = descriptionBox.val();

		if (name && description) {
			nameBox.val('');
			descriptionBox.val('');

			subj = new Subject(name, description);
			subjectBase.push(subj.getData());
		}
	});
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
	this.generateHtml = function () {
		return '<a href="' + this.getUrl() + '" class="list-group-item"><h4 class="list-group-item-heading">' +
						this.name + '</h4> <p class="list-group-item-text">' + this.description + '</p> </a>';
	}
}