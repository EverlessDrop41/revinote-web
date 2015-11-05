jQuery(document).ready(function ($) {
	bw = $("#BrowserWidget");

	bw.dialog({
		resize: function (event, ui) {
			frame = $("#BrowserWidgetIFrame");
			heightPadding = frame.outerHeight() - frame.innerHeight() + $("#BrowserHomeBtn").outerHeight();
			frame.height(bw.height() - heightPadding);

			frame.width(bw.width() - 5);
		}
	});

	$("#BrowserHomeBtn").click(function () {
		$("#BrowserWidgetIFrame").attr('src','https://duckduckgo.com');
	});

	bw.dialog('close');

	$("#BrowserToggle").click(function () {
		if (bw.dialog("isOpen")) {
			bw.dialog('close');
		} else {
			bw.dialog('open');
		}
	});
});