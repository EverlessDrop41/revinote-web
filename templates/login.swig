{% extends "layout.swig" %}

{% block content %}
<div class="container">
	<div class="row">
		<div class="panel panel-default">
		  <div class="panel-body">
		    <form action="/{% if signup %}sign_up{% else %}login{% endif %}" method="post">
		    	<h1>{% if signup %} Sign up {% else %} Login {% endif %}</h1>
		    	{% if signup %} <div class="alert alert-info" role="alert"><strong>Notice: </strong> Creating an account will not log you in</div> {% endif %}

					{% include "notifications.swig" %}

				  <div class="form-group">
				    <label for="exampleInputEmail1">Email address</label>
				    <input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="Email" required>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">Password</label>
				    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
				  </div>

					<div class="btn-group btn-group-justified" role="group" aria-label="...">
					  <div class="btn-group" role="group">
					    <button type="submit" class="btn btn-primary">Submit</button>
					  </div>
					  <div class="btn-group" role="group">
					  {% if signup %}
					  	<a type="button" href="/login" class="btn btn-info">
					    	Sign in
					    </a>
					  {% else %}
					  	<a type="button" href="/sign_up" class="btn btn-info">
					    	Sign up
					    </a>
					  {% endif %}
					  </div>
					  <div class="btn-group" role="group">
					    <a type="button" href="/reset_password" class="btn btn-warning">
					    	Forgotten Password?
					    </a>
					  </div>
					</div>
				</form>
		  </div>
		</div>
	</div>
</div>
{% endblock %}