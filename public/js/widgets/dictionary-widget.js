jQuery(document).ready(function ($) {

	function Word (word, results, syllables){
		this.word = word;
		this.results = results;
		this.syllables = syllables;
	};

	Word.prototype.resultsHtml = function() {
		rerStr = "";

		arrayLength = this.results.length;
		for (var i = 0; i < arrayLength; i++) {
		  res = this.results[i];
		  rerStr += "<em>" + res.partOfSpeech + "</em>";
		  rerStr += "<p>" + res.definition + "</p>";
		  if (i != arrayLength - 1) {
		  	rerStr += "<hr>";
		  }
		}

		return rerStr;
	};

	Word.prototype.generateHtml = function() {
		return "<h2>" + this.word + "</h2>" + this.resultsHtml();
	};


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
	  	w = new Word(data.word, data.results, data.syllables);
			console.log(w.generateHtml());
		}
	});
});