function Note (title, content, subject){
	this.title = title;
	this.content = content;
	this.subject = subject;
	this.key;
	this.getUrl = function () {
		return "/subjects/" + this.subject + "/" + this.key;
	}
	this.getData = function () {
		return {title: title, content: content, subject: this.subject};
	}
	this.generateHtml = function () {
		return '<a href="' + this.getUrl() + '" class="list-group-item"><h4 class="list-group-item-heading">' +
						this.title + '</h4> <p class="list-group-item-text">' + this.getSnippet() + '</p> </a>';
	}
	this.getSnippet = function () {
		return this.content.split('. ')[0];
	}
	this.setKey = function (val) {
		this.key = val;
	}
	this.getKey = function() {
		return key;
	}
}