jQuery(document).ready(function ($) {
	//Note Editor
	var converter = new Markdown.Converter();
	Markdown.Extra.init(converter);
	var editor = new Markdown.Editor(converter);

	editor.getConverter();
	editor.run();

	var ToggleBtn = $("#ToggleVisibility");
	var ToggleIcon = $(ToggleBtn.attr('data-icon'));

	var eyeOpen = 'fa-eye';
	var eyeClosed = eyeOpen + '-slash';

	var wmd_preview = $("#wmd-preview");

	ToggleBtn.click(function () {
		wmd_preview.slideToggle();

		if (ToggleIcon.hasClass(eyeOpen)) {
			ToggleIcon.removeClass(eyeOpen);
			ToggleIcon.addClass(eyeClosed);
		} else {
			ToggleIcon.removeClass(eyeClosed);
			ToggleIcon.addClass(eyeOpen);
		}
	});

	$("#wmd-input").keyup(function () {
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
	});

	ToggleBtn.click();
});