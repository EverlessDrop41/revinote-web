{% extends "layout.swig" %}

{% block content %}
<div class="container">
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">
		    <h1 class="panel-title"><strong>Send Password Reset Email</strong></h1>
		  </div>
		  <div class="panel-body">
		  	{% for message in successes %}
				<div class="alert alert-dismissible alert-success" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					{{ message }}
				</div>
				{% endfor %}

				{% for message in infos %}
				<div class="alert alert-dismissible alert-info" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					{{ message }}
				</div>
				{% endfor %}

				{% for message in warnings %}
				<div class="alert alert-dismissible alert-warning" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					{{ message }}
				</div>
				{% endfor %}
				
				{% for message in dangers %}
				<div class="alert alert-dismissible alert-danger" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					{{ message }}
				</div>
				{% endfor %}
				
				<form method="POST" action="/reset_password" >
					<div class="form-group">
				    <label for="email">Email</label>
				    <input type="email" class="form-control" id="email" placeholder="Email" name="email" required>
				  </div>

				  <button type="submit" class="btn btn-primary btn-block">Send Password Reset Email</button>
				</form>
		  </div>
		 </div>
	</div>
</div>
{% endblock %}