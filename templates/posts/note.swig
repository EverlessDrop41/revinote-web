{% extends '../layout.swig' %}

{% block content %}
<script> 
	var uid = "{{ user.uid }}"; 
	var subject = "{{ subject }}"; 
	var noteId = "{{ noteId }}";
	var hasRequiredData = (uid != "" && subject != "" && noteId != "") && (uid && subject && noteId);
</script>

<div class="container">
	<div class="row">

		<div class="btn-group btn-group-justified" role="group" aria-label="...">
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-info" id="EditToggle">Edit Note</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-danger" id="DeleteNoteBtn">Delete Note</button>
		  </div>
		</div>

		<br>

		<div class="btn-group btn-group-justified" role="group" aria-label="widgets">
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-default" id="BrowserToggle">Toggle Broswer</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-default" id="DictionaryToggle">Toggle Dictionary</button>
		  </div>
		</div>

		<br />

		<div class="panel panel-default" id="NoteEditor">
			<div class="panel-heading">
		    <h1 class="panel-title"><strong> <span class="glyphicon glyphicon-edit" aria-hidden="true"></span> &nbsp; Edit Note</strong></h1>
		  </div>

			<div class="panel-body">
				<form class="form">
				  <div class="form-group">
				    <label for="EditTitle">Title</label>
				    <input type="text" class="form-control" name="EditTitle" id="EditTitle" placeholder="Note Title">
				  </div>
				  <div class="form-group">
				    <label for="EdtContent">Content</label>
				    {% include "Toolbar.swig" %}
				    <div id="wmd-button-bar" class="hidden"></div>
				    <div type="text" class="form-control note-content-editor no-jax" name="EditContent" id="wmd-input" placeholder="Note Content"></div>
				    <div id="wmd-preview" class="mathjax"></div>
				  </div>
				  <button type="button" class="btn btn-default" id="EditNoteSubmit">Edit Note</button>
				</form>
			</div>
		</div>

		<style type="text/css">
			@media print {
			  body * {
			    visibility: hidden;
			  }

				#PrintData, #PrintData * {
			    visibility: visible;
			  }

			  #PrintData {
			    visibility: visible;
			    position: absolute;
			    left: 0;
			    top: 0;
			  }
			}
		</style>
		
		<div id="PrintData">
			<div class="page-header">
			  <h1 id="Title">Loading...</h1>
			</div>

			<div class="panel" id="loading" data-backdrop="static" data-keyboard="false">
	      <div class="panel-header">
	         <h1>Loading...</h1>
	      </div>
	      <div class="panel-body">
	        <div class="progress">
					  <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
					  </div>
					</div>
	      </div>
	    </div>

			<p id="Content" class="mathjax">
			  Loading....
			</p>
		</div>

		<div id="BrowserWidget" class="" title="Browser">
			<button type="button" id="BrowserHomeBtn" class="btn btn-primary btn-lg btn-block"><i class="fa fa-home"></i>Home</button>
			<iframe class="embed-responsive-item" id="BrowserWidgetIFrame" src="http://duckduckgo.com"></iframe>
		</div>

		<div id="DictionaryWidget" title="Dictionary">
			  <div class="form-inline">
			  	<div class="form-group">
				    <label for="wordInput">Word</label>
				    <input type="text" class="form-control" id="wordInput" placeholder="Input a word...">
				    <button type="submit" id="submitWord" class="btn btn-default">Find Word</button>
				  </div>
			  </div>
			  <p id="definitionBox"></p>
		</div>

	</div>
</div>

<script src="/js/note.js"></script>
<script src="/js/note-editor.js"></script>
<script src="/js/note-page.js"></script>
<script src="/js/widgets/dictionary-widget.js"></script>
<script src="/js/widgets/browser-widget.js"></script>

{#<script src="/js/notes-list-page.js"></script>#}
{% endblock %}