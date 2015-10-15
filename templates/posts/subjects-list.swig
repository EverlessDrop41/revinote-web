{% extends '../layout.swig' %}

{% block content %}
<script> var uid = "{{ user.uid }}"; </script>

<div class="container">
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">
		    <h1 class="panel-title"><strong>Add subject</strong></h1>
		  </div>

			<div class="panel-body">
				<form class="form-inline">
				  <div class="form-group">
				    <label for="name">Name</label>
				    <input type="text" class="form-control" name="name" id="name" placeholder="English">
				  </div>
				  &nbsp;&nbsp;
				  <div class="form-group">
				    <label for="description">Description</label>
				    <input type="text" class="form-control" name="description" id="description" placeholder="Words 'n stuff">
				  </div>
				  <button type="button" class="btn btn-default" id="AddSubject">Add Subject</button>
				</form>
			</div>
		</div>

		<div class="page-header">
		  <h1>Veiwing list of subjects</h1>
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

		<div class="list-group" id="SubjectList">
		  {# Subject List #}
		  
		</div>
	</div>
</div>

<script src="/js/subjects-page.js"></script>
{% endblock %}