var ace1;

jQuery(document).ready(function ($) {
	//Note Editor
	var converter = new Markdown.Converter();
	Markdown.Extra.init(converter);
	var editor = new Markdown.Editor(converter);
  
  var text = document.getElementById('wmd-input').innerHTML;
  ace1 = ace.edit("wmd-input");
  ace1.setValue(text, -1);
  editor.run(ace1);
  ace1.setTheme("ace/theme/chrome");
  ace1.getSession().setMode("ace/mode/markdown");

  console.log("Initialized Editor");
  $( "#wmd-input" ).resizable({
    resize: function( event, ui ) {
      ace1.resize();
    }
  });

  ace1.resize();
	ace1.renderer.updateFull();
	ace1.getSession().setUseWrapMode(true);

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
	  emojify.run(wmd_preview[0]);

	  //Style Tables
	  $("table").addClass("table");
	});

	//Note Already Exists
	if (typeof noteId !== "undefined") {
		function getRawUrl () {
			loc = window.location
			return loc.protocol + '//' + loc.hostname + ':' + loc.port + '/md/' + uid + '/'+ subject + '/' + noteId;
		}

		$("#ViewRawBtn").click(function () {
			window.open(getRawUrl(),'_blank');
		});

		$("#OpenInStackEdit").click(function () {
			window.open("https://stackedit.io/viewer?url=" + getRawUrl(), '_blank');
		});

		$("#PrintBtn").click(function () {
			window.print();
		});
	}

	ToggleBtn.click();
});