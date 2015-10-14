<!DOCTYPE html>
<html>
	<head>
		<title>{% block title %}Revinote{% endblock %}</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

		<link rel="stylesheet" type="text/css" href="/css/main.css">
		{% block head %} {% endblock %}
	</head>

	<body>
		<nav class="navbar navbar-dark">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-contents" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="/">Revinote</a>
		    </div>

		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="navbar-contents">
		      <ul class="nav navbar-nav">
		        <li><a href="/">Home</a></li>
		        <li><a href="/posts/subjects">About</a></li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		      	{% if user %}
		      		<li><a href="/user_settings">Signed in as {{ user.email|default('[ERROR NO USERNAME]') }}</a></li>
		      		<li><a href="/logout">Logout</a></li>
		      	{% else %}
			        <li><a href="/login">Sign in</a></li>
			        <li><a href="/sign_up">Sign up</a></li>
		        {% endif %}
		      </ul>
		    </div><!-- /.navbar-collapse -->
		</nav>
        {% block content %}{% endblock %}
	</body>
</html>