//Note Page
jQuery(document).ready(function ($) {
	TitleBox = $("#Title");
	ContentBox = $("#Content");


	LoadingBox = $("#loading");

	if (hasRequiredData && FireRef) {
		var converter = new Markdown.Converter();
		TitleBox.hide();
		ContentBox.hide();

		userBase = FireRef.child(uid);
		notesBase = userBase.child("notes");
		subjectBase = notesBase.child(subject);
		note = subjectBase.child(noteId);
		
		note.on("value", function(snap) {
			LoadingBox.show();
			TitleBox.hide();
			ContentBox.hide();

			var data = snap.val();
			TitleBox.text(data.title);
			ContentBox.html(converter.makeHtml(data.content));

			LoadingBox.hide();
			TitleBox.show();
			ContentBox.show();
		}, function (err) {
			console.error(err.code);
		});
	} else {
		console.error("Uid and/or FireRef and/or Subject and/or Note Id not assigned");
	}
});