{# Toolbar.swig #}
<div class="btn-toolbar">
	<div class="btn-group" role="group" aria-label="Emphasis">
	  <button type="button" class="btn btn-default" emulate="#wmd-bold-button" title="Bold">
	  	<i class="fa fa-bold fa-lg fa-pm"></i>
	  </button>
	  <button type="button" class="btn btn-default" emulate="#wmd-italic-button" title="Italic">
			<i class="fa fa-italic fa-lg fa-pm"></i>
	  </button>
	</div>
	<div class="btn-group" role="group" aria-label="Blocks">
	  <button type="button" class="btn btn-default" emulate="#wmd-link-button" title="Add Link">
	  	<i class="fa fa-link fa-lg fa-pm" ></i>
	  </button>
	  <button type="button" class="btn btn-default" emulate="#wmd-quote-button" title="Add Quote">
			<i class="fa fa-quote-left fa-lg fa-pm"></i>
	  </button>
	  <button type="button" class="btn btn-default" emulate="#wmd-code-button" title="Add Code">
			<i class="fa fa-code fa-lg fa-pm"></i>
	  </button>
	  <button type="button" class="btn btn-default" emulate="#wmd-image-button" title="Add Image">
			<i class="fa fa-picture-o fa-lg fa-pm"></i>
	  </button>
	</div>

	<div class="btn-group" role="group" aria-label="Misc">
	  <button type="button" class="btn btn-default" emulate="#wmd-olist-button" title="Ordered Lists">
	  	<i class="fa fa-list-ol fa-lg fa-pm"></i>
	  </button>
	  <button type="button" class="btn btn-default" emulate="#wmd-ulist-button" title="Un-Ordered List">
			<i class="fa fa-list-ul fa-lg fa-pm"></i>
	  </button>
	  <button type="button" class="btn btn-default" emulate="#wmd-heading-button" title="Heading">
			<i class="fa fa-header fa-lg fa-pm"></i>
	  </button>
	  <button type="button" class="btn btn-default" emulate="#wmd-hr-button" title="Horizontal Break">
			<i class="fa fa-minus fa-lg fa-pm"></i>
	  </button>
	</div>

	<div class="btn-group" role="group" aria-label="History">
	  <button type="button" class="btn btn-default" emulate="#wmd-undo-button" title="Undo">
	  	<i class="fa fa-undo fa-lg fa-pm"></i>
	  </button>
	  <button type="button" class="btn btn-default" emulate="#wmd-redo-button" title="Redo">
			<i class="fa fa-repeat fa-lg fa-pm"></i>
	  </button>
	</div>

	<div class="btn-group" role="group" aria-label="History">
	  <button type="button" class="btn btn-default" id="ToggleVisibility" data-icon="#ToggleVisibilityIcon" title="Toggle Visibility">
	  	<i class="fa fa-eye fa-lg fa-pm" id="ToggleVisibilityIcon" ></i>
	  </button>
	</div>

	<div class="btn-group" role="group" aria-label="History">
		<a href="/post-help" target="_blank">
		  <button type="button" class="btn btn-default" title="Markdown Help">
		  	<i class="fa fa-question-circle fa-lg fa-pm"></i> Help
		  </button>
		</a>
	</div>
	
	{% if noteId %}
	<div class="btn-group" role="group" aria-label="History">
		<button type="button" class="btn btn-default" id="ViewRawBtn" title="View raw post data">
	  	View Raw
	  </button>
	  <button type="button" class="btn btn-default" id="OpenInStackEdit" title="Open In Stack Edit">
	  	Open In Stack Edit
	  </button>
	</div>
	{% endif %}
</div>