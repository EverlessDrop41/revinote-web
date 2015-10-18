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
		
		<!--Firebase Libary-->
		<script src="https://cdn.firebase.com/js/client/2.3.1/firebase.js"></script>
		<script>var FireRef = new Firebase("https://revinote.firebaseio.com/");</script>

		<!--jQuery CDN-->
		<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
		<link rel="stylesheet" type="text/css" href="/css/main.css">

		{# Markdown Data #}
		<script type="text/javascript" src="/js/Markdown.Converter.js"></script>
		<script type="text/javascript" src="/js/Markdown.Extra.min.js"></script>
		{% if md-editor %}<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pagedown/1.0/Markdown.Editor.min.js"></script>{% endif %}

		{# HighlightJs #}
		<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.8.0/styles/github.min.css">
		<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.8.0/highlight.min.js"></script>

		{# Emojify #}
		<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/emojify.js/0.9.5/emojify.min.css" />
		<script src="//cdnjs.cloudflare.com/ajax/libs/emojify.js/0.9.5/emojify.min.js"></script>

		{# MathJax #}
		<script src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
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
		        {% if user %}<li><a href="/subjects">Subjects</a></li>{% endif %}
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		      	{% if user %}
		      		<li><a href="/user_settings">Signed in as {{ user.email|default('[ERROR NO USERNAME]') }}</a></li>
		      		<li><a href="/user_settings"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></a></li>
		      		<li><a href="/logout">Logout</a></li>
		      	{% else %}
			        <li><a href="/login">Sign in</a></li>
			        <li><a href="/sign_up">Sign up</a></li>
		        {% endif %}
		      </ul>
		    </div><!-- /.navbar-collapse -->
		</nav>
		{% if breadcrumb %}
		<div class="container">
			<div class="row">
				<ol class="breadcrumb">
				{% for item in breadcrumb %} 
					{% if item.isActive %}
				  	<li class="active">{{item.name}}</li>
				  {% else %}
				  	<li><a href="{{item.url}}">{{item.name}}</a></li>
				  {% endif %}
				{% endfor %}
				</ol>
			</div>
		</div>
		{% endif %}
    {% block content %}{% endblock %}	</body>
</html>