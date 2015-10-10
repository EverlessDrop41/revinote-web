{% extends "layout.swig" %}

{% block content %}
<div class="container-fluid">
	<div class="row">
		<div class="col-xs-1"></div>
		<div class="panel panel-default col-xs-10">
		  <div class="panel-body">
		    <form action="/login" method="post">
		    	<h1>Login</h1>
				  <div class="form-group">
				    <label for="exampleInputEmail1">Email address</label>
				    <input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">Password</label>
				    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
				  </div>
				  <button type="submit" class="btn btn-default">Submit</button>
				</form>
		  </div>
		</div>
		<div class="col-xs-1"></div>
	</div>
</div>
{% endblock %}