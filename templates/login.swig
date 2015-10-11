{% extends "layout.swig" %}

{% block content %}
<div class="container">
	<div class="row">
		<div class="col-xs-1"></div>
		<div class="panel panel-default col-xs-10">
		  <div class="panel-body">
		    <form action="/{% if signup %}sign_up{% else %}login{% endif %}" method="post">
		    	<h1>{% if signup %} Sign up {% else %} Login {% endif %}</h1>
		    	{% if signup %} <div class="alert alert-info" role="alert"><strong>Notice: </strong> Creating an account will not log you in</div> {% endif %}
				  <div class="form-group">
				    <label for="exampleInputEmail1">Email address</label>
				    <input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="Email" required>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">Password</label>
				    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
				  </div>
				  <button type="submit" class="btn btn-default">Submit</button>
				</form>
		  </div>
		</div>
		<div class="col-xs-1"></div>
	</div>
</div>
{% endblock %}