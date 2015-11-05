jQuery(document).ready(function ($) {
	bw = $("#BrowserWidget");

	bw.dialog({
		resize: function (event, ui) {
			frame = $("#BrowserWidgetIFrame");
			heightPadding = frame.outerHeight() - frame.innerHeight();
			frame.height(bw.height() - heightPadding);

			frame.width(bw.width());
		}
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