//Emily Peregrine
jQuery(document).ready(function ($) {
	noteList = $("#NotesList");

	TitleBox = $("#Title");
	ContentBox = $("#wmd-input");

	AddNotePanel = $("#AddNotePanel");
	AddNoteToggle = $("#AddNoteToggle");
	DeleteNoteBtn = $("#DeleteNoteBtn");

	AddNotePanel.hide();

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
				note.setKey(notesSnap.key());
				noteList.append(note.generateHtml());
			});
			$("#list-loading").hide();
		}, function (err) {
			console.error(err.code);
		});

		$("#AddNote").click(function() {
			name = TitleBox.val();
			description = ace1.getValue();

			if (name && description) {
				TitleBox.val('');
				ContentBox.val('');

				note = new Note(name, description, subject);
				console.log(note);
				subjectBase.push(note.getData());
			}
		});

		AddNoteToggle.click(function () {
			AddNotePanel.slideToggle();
		});

		DeleteNoteBtn.click(function() {
			subjBase = userBase.child("subjects");
			subjBase.on("value", function(snap) {
				snap.forEach(function (subjSnap) {
					data = subjSnap.val();
					if (data.name.toLowerCase() == subject.toLowerCase()) {
						subjectBase.remove();
						var c = subjBase.child(subjSnap.key());
						c.remove();
						window.location = "/subjects";
					}
				});
			}, function (err) {
				console.error(err.code);
			});

		});
	} else {
		console.error("Uid and/or FireRef and/or Subject not assigned");
	}
});