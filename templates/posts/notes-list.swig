{% extends '../layout.swig' %}

{% block content %}
<script> var uid = "{{ user.uid }}"; var subject = "{{ subject }}"; var hasRequiredData = (uid != "" && subject != "") && (uid && subject)</script>

<div class="container">
	<div class="row">
		<div class="btn-group btn-group-justified" role="group" aria-label="...">
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-info" id="AddNoteToggle">Add Note</button>
		  </div>
		  <div class="btn-group" role="group">
		    <button type="button" class="btn btn-danger" id="DeleteNoteBtn">Delete Subject</button>
		  </div>
		</div>

		<br />

		<div class="panel panel-default" id="AddNotePanel">
			<div class="panel-heading">
		    <h1 class="panel-title"><strong>Add note</strong></h1>
		  </div>

			<div class="panel-body">
				<form class="form">
				  <div class="form-group">
				    <label for="Title">Title</label>
				    <input type="text" class="form-control" name="Title" id="Title" placeholder="Note Title">
				  </div>
				  <div class="form-group">
				    <label for="Content">Content</label>
				    {% include "Toolbar.swig" %}
				    <div id="wmd-button-bar" class="hidden"></div>
				    <div type="text" class="form-control note-content-editor no-jax" name="EditContent" id="wmd-input" placeholder="Note Content"></div>
				    <div id="wmd-preview"></div>
					</div>
				  <button type="button" class="btn btn-default" id="AddNote">Add Note</button>
				</form>
			</div>
		</div>

		<div class="page-header">
		  <h1>{{subject|title}} Notes</h1>
		</div>

		<div class="panel" id="list-loading" data-backdrop="static" data-keyboard="false">
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

		<div class="list-group" id="NotesList">
		  {# Subject List #}
		  
		</div>
	</div>
</div>

<script src="/js/note.js"></script>
<script src="/js/note-editor.js"></script>
<script src="/js/notes-list-page.js"></script>
{% endblock %}