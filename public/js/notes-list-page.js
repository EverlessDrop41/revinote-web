//Emily Peregrine
jQuery(document).ready(function ($) {
	noteList = $("#NotesList");

	TitleBox = $("#Title");
	ContentBox = $("#Content");

	if (hasRequiredData && FireRef) {
		userBase = FireRef.child(uid);
		notesBase = userBase.child("notes");
		subjectBase = notesBase.child(subject);
		
		subjectBase.on("value", function(snap) {
			noteList.html('');
			$("#list-loading").show();
			snap.forEach(function (notesSnap) {
				data = notesSnap.val();
				note = new Note(data.title, data.content, subject);
				noteList.append(note.generateHtml());
			});
			$("#list-loading").hide();
		}, function (err) {
			console.error(err.code);
		});

		$("#AddNote").click(function() {
			name = TitleBox.val();
			description = ContentBox.val();

			if (name && description) {
				TitleBox.val('');
				ContentBox.val('');

				note = new Note(name, description, subject);
				console.log(note);
				subjectBase.push(note.getData());
			}
		});
	} else {
		console.error("Uid and/or FireRef and/or Subject not assigned");
	}
});

function Note (title, content, subject){
	this.title = title;
	this.content = content;
	this.subject = subject;
	this.getUrl = function () {
		return "/subjects/" + this.subject + "/" + this.title;
	}
	this.getData = function () {
		return {title: title, content: content, subject: this.subject};
	}
	this.generateHtml = function () {
		return '<a href="' + this.getUrl() + '" class="list-group-item"><h4 class="list-group-item-heading">' +
						this.title + '</h4> <p class="list-group-item-text">' + this.content + '</p> </a>';
	}
}