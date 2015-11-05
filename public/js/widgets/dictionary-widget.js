jQuery(document).ready(function ($) {
	dw = $("#DictionaryWidget");

	$("#DictionaryWidget").dialog();

	dw.dialog('close');

	$("#DictionaryToggle").click(function () {
		if (dw.dialog("isOpen")) {
			dw.dialog('close');
		} else {
			dw.dialog('open');
		}
	});
});