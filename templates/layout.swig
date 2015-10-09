<!DOCTYPE html>
<html>
	<head>
		<title>{% block title %}Revinote{% endblock %}</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="css/main.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		{% block head %} {% endblock %}
	</head>

	<body>
		<header>
			<div class="titlebar">
				<h1>Revinote</h1>
			</div>
		</header>
        {% block content %}{% endblock %}
	</body>
</html>