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

	$.ajax({
		url : "https://wordsapiv1.p.mashape.com/words/bump", 
		beforeSend: function( xhr ) {
	  	xhr.setRequestHeader("X-Mashape-Key", "8eVWqtLfcGmsh6SVYIdtEi3RFU0wp1eHyfFjsn55YAFaazgReV");
	  },
	  success: function (data) {
			console.log(data);
		}
	});
});