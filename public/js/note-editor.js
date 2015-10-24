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

	//Note Already Exists
	if (typeof noteId !== "undefined") {
		function getRawUrl () {
			loc = window.location
			return loc.protocol + '//' + loc.hostname + ':' + loc.port + '/md/' + uid + '/'+ subject + '/' + noteId;
		}

		function printdiv()
		{
			var headstr = "<html><head><title></title></head><body>";
			var footstr = "</body>";
			var newstr = '<h1>' + document.all.item('Title').innerHTML + '</h1>' + document.all.item('Content').innerHTML;
			var oldstr = document.body.innerHTML;
			document.body.innerHTML = headstr+newstr+footstr;
			window.print();
			document.body.innerHTML = oldstr;
			return false;
		}

		$("#ViewRawBtn").click(function () {
			window.open(getRawUrl(),'_blank');
		});

		$("#OpenInStackEdit").click(function () {
			window.open("https://stackedit.io/viewer?url=" + getRawUrl(), '_blank');
		});

		$("#PrintBtn").click(function () {
			printdiv();
		});
	}

	ToggleBtn.click();
});