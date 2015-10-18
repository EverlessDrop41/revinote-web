{% extends 'layout.swig' %}

{% block head %}
{% endblock %}

{% block content %}
<div class="container">
  <div class="jumbotron">
    <h1>Revinote <small>Revision Notes</small></h1>
    <p>Revinote is a note making app, aimed at making notes for revision easier. It uses Firebase, which allows all notes to be synced in realtime accross all devices</p>
  </div>
  
  <div class="row">
    <div class="col-xs-12">
      <div class="page-header">
        <h1>Features</h1>
      </div>
      <ul>
        <li>Create your own word definition bank</li>
        <li>Built in dictionary</li>
        <li>Reltime accross all devices</li>
        <li>Cross Platform</li>
        <li>Bibliography/ Refrences creator for notes</li>
      </ul>
    </div>
  </div>

  <div class="row">
    <div class="col-xs-12">
      <div class="page-header">
        <h1>Clients</h1>
      </div>
      <ul>
        <li> Web <strong>[In-Development]</strong></li>
        <li> Android <strong>[Planned]</strong></li>
        <li> IOS <strong>[Planned]</strong></li>
        <li> Windows Phone <strong>[Planned]</strong></li>
        <li> Desktop <strong>[Planned]</strong></li>
        <li> Chrome Plugin <strong>[Planned]</strong></li>
      </ul>
    </div>
  </div>

  <div class="row">
    <div class="col-xs-12">
      <div class="page-header">
        <h1>Technologies Used</h1>
      </div>
      <h3 id="firebase">Firebase</h3>
      <p>The database, it handles the user accounts and also allows for realtime post editing</p>

      <h3 id="nodejs-expressjs">Node.js + Express.js</h3>
      <p>For the backend, mostly the website. Very fast and allows server to be written in javascript. Express.js is a libary that makes setting up a http or https server very easy and fast. Node.js being written in javascript will allow easy interaction with the Firebase API.</p>

      <h3 id="xamarin">Xamarin</h3>
      <p>Used for mobile apps. Xamarin.Forms allows one codebase to be used on Android, IOS and Windows Phone</p>
  </div>
</div>
{% endblock %}