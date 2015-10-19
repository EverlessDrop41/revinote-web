//Note Page
jQuery(document).ready(function ($) {
	TitleBox = $("#Title");
	ContentBox = $("#Content");

	LoadingBox = $("#loading");

	NoteEditor = $("#NoteEditor");
	EditTitle = $("#EditTitle");
	EditContent = $("#wmd-input");
	EditNoteBtn = $("#EditNoteSubmit");

	EditToggle = $("#EditToggle");
	DeleteNoteBtn = $("#DeleteNoteBtn");

	if (hasRequiredData && FireRef) {
		NoteEditor.hide();
		var converter = new Markdown.Converter();
		Markdown.Extra.init(converter);
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

			EditTitle.val(data.title);
			EditContent.text(data.content);

			LoadingBox.hide();
			TitleBox.show();
			ContentBox.show();

			//MathJax
		  MathJax.Hub.Queue(["Typeset",MathJax.Hub]);

		  //Highlight.js
		  $('pre code').each(function(i, block) {
		    hljs.highlightBlock(block);
		  });

		  //Emojify.js
		  emojify.setConfig({img_dir: 'http://hassankhan.me/emojify.js/images/emoji'});
		  emojify.run();

		  //Style Tables
		  $("table").addClass("table");
		}, function (err) {
			console.error(err.code);
		});

		DeleteNoteBtn.click(function () {
			note.remove();
			window.location = "/subjects/" + subject;
		});

		EditToggle.click(function () {
			NoteEditor.slideToggle();
		})

		EditNoteBtn.click(function () {
			var n = new Note(EditTitle.val(), EditContent.val(), subject);
			note.update(n.getData());
		});
	} else {
		console.error("Uid and/or FireRef and/or Subject and/or Note Id not assigned");
	}
});