{% extends 'layout.swig' %}

{% block content %}
<script> var uid = "{{ user.uid }}"; </script>

<div class="container">
	<div class="row">
		<div class="page-header">
		  <h1>Veiwing list of subjects</h1>
		</div>
		<div class="list-group">
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
{% endblock %}