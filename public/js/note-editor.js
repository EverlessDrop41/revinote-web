jQuery(document).ready(function ($) {
	//Note Editor
	var converter = new Markdown.Converter();
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

	ToggleBtn.click();
});