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
		<div class="panel panel-default" id="NoteEditor">
			<div class="panel-heading">
		    <h1 class="panel-title"><strong>Edit Note</strong></h1>
		  </div>

			<div class="panel-body">
				<form class="form">
				  <div class="form-group">
				    <label for="EditTitle">Title</label>
				    <input type="text" class="form-control" name="EditTitle" id="EditTitle" placeholder="Note Title">
				  </div>
				  <div class="form-group">
				    <label for="EdtContent">Content</label>
				    <textarea type="text" class="form-control" name="EditContent" id="EditContent" placeholder="Note Content"></textarea>
				  </div>
				  <button type="button" class="btn btn-default" id="EditNoteSubmit">Edit Note</button>
				</form>
			</div>
		</div>

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

		<p id="Content">
		  Loading....
		</p>
	</div>
</div>

<script src="/js/note.js"></script>
<script src="/js/note-page.js"></script>
{#<script src="/js/notes-list-page.js"></script>#}
{% endblock %}