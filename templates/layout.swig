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

		<link rel="stylesheet" href="https://cdn.jsdelivr.net/bootflat/2.0.0/css/bootflat.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bootflat/2.0.0/css/bootflat.css.map">
		
		<!--Firebase Libary-->
		<script src="https://cdn.firebase.com/js/client/2.3.1/firebase.js"></script>
		<script>var FireRef = new Firebase("https://revinote.firebaseio.com/");</script>

		<!--jQuery CDN-->
		<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
		<link rel="stylesheet" type="text/css" href="/css/main.css">

		{# Fonts #}
		<link href='https://fonts.googleapis.com/css?family=Lora|Montserrat' rel='stylesheet' type='text/css'>

		{# Markdown Data #}
		<script type="text/javascript" src="/js/Markdown.Converter.js"></script>
		<script type="text/javascript" src="/js/Markdown.Extra.min.js"></script>
		{% if md_editor %}
		<script type="text/javascript" src="/js/Markdown.Editor.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/ace/1.1.01/ace.js" type="text/javascript" charset="utf-8"></script>
		<script>
			jQuery(document).ready(function($) {
          $('[emulate]').click(function(event) {
              //event.preventDefault();
              var emulateIdentitifier = $(this).attr('emulate');
              console.log(emulateIdentitifier);
              if ($(emulateIdentitifier)) {
                  $(emulateIdentitifier).click();
              }
          });
      });
    </script>
		{% endif %}

		{# HighlightJs #}
		<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.8.0/styles/github.min.css">
		<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.8.0/highlight.min.js"></script>
		{# Markdown Highlighting CSS #}
		<link rel="stylesheet" type="text/css" href="/css/Markdown-Highlighting.css">

		{# Emojify #}
		<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/emojify.js/0.9.5/emojify.min.css" />
		<script src="//cdnjs.cloudflare.com/ajax/libs/emojify.js/0.9.5/emojify.min.js"></script>

		{# MathJax #}
		<script src="//cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
		<script type="text/x-mathjax-config">
		  MathJax.Hub.Config({
		  	tex2jax: {
		  		inlineMath: [['$','$']],
					processClass: "mathjax",
    			ignoreClass: "no-mathjax"
				}
			});

			MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
		</script>

		{# font-awesome [Icons] #}
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

		{% block head %} {% endblock %}
	</head>

	<body class="no-mathjax">
	<div id="main_container">
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
		      		<li>
			      		<a href="/user_settings">
			      			Signed in as {{ user.email|default('[ERROR NO USERNAME]') }} 
			      		</a>
		      		</li>
		      		<li><a href="/logout">Logout <i class="fa fa-lg fa-sign-out"></i></a></li>
		      	{% else %}
			        <li><a href="/login"><i class="fa fa-lg fa-sign-in"></i> Sign in</a></li>
			        <li><a href="/sign_up"><i class="fa fa-lg fa-user-plus"></i> Sign up</a></li>
		        {% endif %}
		      </ul>
		    </div><!-- /.navbar-collapse -->
		</nav>

		<div id="content">
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
    {% block content %}{% endblock %}
    </div> 
    <br><br><br>
    </div>

    <div class="footer">
        <div class="container">
        	<div class="clearfix">
        		<div class="footer-logo"><a href="/">Revinote</a></div>
        		<dl class="footer-nav">
	            <dt class="nav-title">REVINOTE</dt>
	            <dd class="nav-item"><a href="/">Web App</a></dd>
	            {#<dd class="nav-item"><a href="#">Blog</a></dd>#}
	            <dd class="nav-item"><a href="https://github.com/EverlessDrop41/revinote-android">Android App</a></dd>
	            <dd class="nav-item"><a href="#">iOS App</a></dd>
	            <dd class="nav-item"><a href="/post-help">Post Formatting</a></dd>
	            <dd class="nav-item"><a href="https://stackedit.io/">Stack Edit</a></dd>
	          </dl>
	          <dl class="footer-nav">
	            <dt class="nav-title"><i class="fa fa-github"></i> CODE</dt>
	            <dd class="nav-item"><a href="https://github.com/EverlessDrop41/revinote-web">Web Repository</a></dd>
	            <dd class="nav-item"><a href="https://github.com/EverlessDrop41/revinote-android">Android Repository</a></dd>
	            <dd class="nav-item"><a href="#">iOS Repository</a></dd>
	          </dl>
	          <dl class="footer-nav">
	            <dt class="nav-title"><i class="fa fa-exclamation-circle"></i> ISSUES</dt>
	            <dd class="nav-item"><a href="https://github.com/EverlessDrop41/revinote-web/issues">Web</a></dd>
	            <dd class="nav-item"><a href="https://github.com/EverlessDrop41/revinote-android/issues">Android</a></dd>
	            <dd class="nav-item"><a href="#">iOS</a></dd>
	          </dl>
	          <dl class="footer-nav">
	          	<dt class="nav-title"><i class="fa fa-user"></i> ACCOUNT</dt>
	          	{% if user %}
	          	<dd class="nav-item"><a href="/user_settings">Account Settings <i class="fa fa-lg fa-cogs"></i> </a></dd>
	            <dd class="nav-item"><a href="/logout">Log Out <i class="fa fa-lg fa-sign-out"></i></a></dd>
	            {% else %}
	            <dd class="nav-item"><a href="/login"><i class="fa fa-lg fa-sign-in"></i> Log In</a></dd>
	            <dd class="nav-item"><a href="/sign_up"><i class="fa fa-lg fa-user-plus"></i> Sign Up</a></dd>
	            {% endif %}
	          </dl>
	         </div>
	         <div class="footer-copyright text-center">Copyright &copy; 2015 Everlessly Coding. All rights reserved.</div>
	      </div>
      </div>
    </body>
</html>