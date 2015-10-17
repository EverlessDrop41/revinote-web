//Note Page
jQuery(document).ready(function ($) {
	TitleBox = $("#Title");
	ContentBox = $("#Content");


	LoadingBox = $("#loading");

	if (hasRequiredData && FireRef) {
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

			LoadingBox.hide();
			TitleBox.show();
			ContentBox.show();

			//MathJax
			var script = document.createElement("script");
		  script.type = "text/javascript";
		  script.src  = "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML";
		  document.getElementsByTagName("head")[0].appendChild(script);

		  //Highlight.js
		  $('pre code').each(function(i, block) {
		    hljs.highlightBlock(block);
		  });

		  //Emojify.js
		  //http://hassankhan.me/emojify.js/images/emoji/smile.png
		  emojify.setConfig({img_dir: 'http://hassankhan.me/emojify.js/images/emoji'});
		  emojify.run();
		}, function (err) {
			console.error(err.code);
		});
	} else {
		console.error("Uid and/or FireRef and/or Subject and/or Note Id not assigned");
	}
});