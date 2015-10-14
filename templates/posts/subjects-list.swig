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
				  <button type="submit" class="btn btn-default">Add Subject</button>
				</form>
			</div>
		</div>

		<div class="page-header">
		  <h1>Veiwing list of subjects</h1>
		</div>
		<div class="list-group" id="SubjectList">
		  <a href="#" class="list-group-item">
		    <h4 class="list-group-item-heading">English</h4>
		    <p class="list-group-item-text">Words n stuff</p>
		  </a>

		  <a href="#" class="list-group-item">
		    <h4 class="list-group-item-heading">Maths</h4>
		    <p class="list-group-item-text">Numbers n stuff</p>
		  </a>

		  <a href="#" class="list-group-item">
		    <h4 class="list-group-item-heading">Geography</h4>
		    <p class="list-group-item-text">Maps n stuff</p>
		  </a>
		</div>
	</div>
</div>

<script src="/js/subjects-page.js"></script>
{% endblock %}