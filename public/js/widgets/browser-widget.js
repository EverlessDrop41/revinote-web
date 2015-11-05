jQuery(document).ready(function ($) {
	$("#BrowserWidget").dialog({
		resize: function (event, ui) {
			frame = $("#BrowserWidgetIFrame");
			heightPadding = frame.outerHeight() - frame.innerHeight();
			frame.height($("#BrowserWidget").height() - heightPadding);

			frame.width($("#BrowserWidget").width());
		}
	});

	$("#BrowserToggle").click(function () {
		//Toggle browser visbility
	});
});