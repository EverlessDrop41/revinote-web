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