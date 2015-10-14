{% extends 'layout.swig' %}

{% block content %}
<div class="container">
	<div class="row">
		<div class="page-header">
		  <h1>Veiwing settings for {{ user.email }}</h1>
		</div>

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

	</div>

	<!--User Info Block-->
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">
		    <h1 class="panel-title"><strong>User Information</strong></h1>
		  </div>

		  <div class="panel-body">
		  	<dl>
				  <dt>Email</dt>
				  <dd>{{user.email}}</dd>
				  <br>
				  <dt>Uid</dt>
				  <dd>{{user.uid}}</dd>
				</dl>
		  </div>
		</div>
	</div>

	<!--Email Change Block-->
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">
		    <h1 class="panel-title"><strong>Change Email</strong></h1>
		  </div>

		  <div class="panel-body">
		    <form method="POST" action="/user_settings/change_email">
		    	<div class="form-group">
				    <label class="control-label">Old Email</label>
				    <div>
				      <p class="form-control-static">{{user.email}}</p>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="pass">New Email</label>
				    <input type="email" class="form-control" id="new_email" placeholder="New Email" name="new_email" required>
				  </div>

				  <div class="form-group">
				    <label for="pass">Password</label>
				    <input type="password" class="form-control" id="pass" placeholder="Password" name="pass" required>
				  </div>
				  <button type="submit" class="btn btn-primary btn-block">Change Email</button>
				</form>
		  </div>
		</div>
	</div>

	<!--Pass Change Block-->
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">
		    <h1 class="panel-title"><strong>Change Password</strong></h1>
		  </div>

		  <div class="panel-body">
		    <form method="POST" action="/user_settings/change_password">
		    	<div class="form-group">
				    <label for="old_pass">Old Password</label>
				    <input type="password" class="form-control" id="old_pass" placeholder="Password" name="old_pass" required>
				  </div>
				  <div class="form-group">
				    <label for="new_pass">New Password</label>
				    <input type="password" class="form-control" id="new_pass" placeholder="Password" name="new_pass" required>
				  </div>
				  <!--
				  <div class="form-group">
				    <label for="confirm_pass">Confirm New Password</label>
				    <input type="password" class="form-control" id="confirm_pass" placeholder="Confirm Password">
				  </div> -->
				  <button type="submit" class="btn btn-primary btn-block">Change Password</button>
				</form>
		  </div>
		</div>
	</div>

	<div class="row">
		<div class="panel panel-danger">
			<div class="panel-heading">
		    <h1 class="panel-title"><strong>Delete Account</strong></h1>
		  </div>

		  <div class="panel-body">
		    <form method="POST" action="/user_settings/delete_user">
					
					<div class="alert alert-danger" role="alert">
						<strong>Warning: </strong> This action is irreversible
					</div>

				  <div class="form-group">
				    <label for="del_pass">Password:</label>
				    <input type="password" class="form-control" id="del_pass" placeholder="Password" name="pass" required>
				  </div>
				  <button type="submit" class="btn btn-danger btn-block">Delete</button>
				</form>
		  </div>
		</div>
	</div>

</div>
{% endblock %}