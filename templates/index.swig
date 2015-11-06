{% extends 'layout.swig' %}

{% block head %}
{% endblock %}

{% block content %}
<div class="container">
  <div class="jumbotron">
    <div class="jumbotron-contents">
      <h1>Revinote <small>Revision Notes</small></h1>
      <p>Revinote is a note making app, aimed at making notes for revision easier. It uses Firebase, which allows all notes to be synced in realtime accross all devices</p>
    </div>
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
        <li> iOS <strong>[Planned]</strong></li>
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
      <h3 id="nodejs"><a href="https://nodejs.org/en/">Node.js</a></h3>
      <p>A Framework that allows javascript to run in a desktop environment</p>
      <p>I chose node because of it’s popularity (so it has a lot of packages) and that I already know javascript so it’s quite easy to learn</p>
      <h3 id="expressjs"><a href="http://expressjs.com/">Express.js</a></h3>
      <p>A Library that makes creating a web server a lot easier. </p>
      <p>I chose this because it speeds up the development process and there was no need for something more optimised. Another advantage is that it’s very popular thus well documented</p>
      <h3 id="firebase"><a href="https://www.firebase.com/">Firebase</a></h3>
      <p>A realtime database system</p>
      <p>I chose to use firebase because the app will be cross platform. Firebase provides an api for many platforms so this will make developing for other platforms easier.</p>
      <p>The server uses Firebase to login but most of the data handling is done on the front end.</p>
      <h3 id="swig"><a href="http://paularmstrong.github.io/swig/">Swig</a></h3>
      <p>An node templating language.</p>
      <p>I chose this because I like the syntax of it and I had prior experience with it. Upon reflection I would probably </p>
      <h3 id="cookie-session"><a href="https://www.npmjs.com/package/cookie-session">Cookie Session</a></h3>
      <p>This is a simple library for express that handles session data. My reasons for using this are pretty self explanatory.</p>
      <h3 id="body-parser"><a href="https://www.npmjs.com/package/body-parser">Body-Parser</a></h3>
      <p>An express library that makes getting request data easier</p>
      <h3 id="bootstrap-3"><a href="https://getbootstrap.com/">Bootstrap 3</a></h3>
      <blockquote>
        <p>Bootstrap is the most popular HTML, CSS, and JS framework for developing responsive, mobile first projects on the web.</p>
      </blockquote>
      <p>I used bootstrap as my U.I. framework as it made prototyping a lot easier and attractive. This choice was purely for speed. Due to it’s popularity and me using a CDN it shouldn’t affect the load times as the user will cache a copy from previous sites</p>
      <h3 id="bootflat"><a href="http://bootflat.github.io/">Bootflat</a></h3>
      <p>Bootflat is a flat UI theme for bootstrap</p>
      <h3 id="jquery"><a href="https://jquery.com/">jQuery</a></h3>
      <blockquote>
        <p>jQuery is a fast, small, and feature-rich JavaScript library. It makes things like HTML document traversal and manipulation, event handling, animation, and Ajax much simpler with an easy-to-use API that works across a multitude of browsers. With a combination of versatility and  extensibility, jQuery has changed the way that millions of people write JavaScript.
        </p>
      </blockquote>
      <p>I chose to use jQuery because it makes interacting with the DOM a lot easier, it also includes some animations</p>
      <h3 id="pagedown"><a href="https://code.google.com/p/pagedown/">PageDown</a></h3>
      <p>PageDown is a popular javascript library for working with markdown. It includes a converter and an editor.</p>
      <p>All notes are formatted with markdown</p>
      <p>I chose this because it’s easy to work with, and it is used by popular sites such as StackExchange</p>
      <h3 id="pagedown-extra"><a href="https://github.com/jmcmanus/pagedown-extra">Pagedown Extra</a></h3>
      <p>A collection of plugins for Pagedown to enable mardown extra features. These features include things like tables, better paragraph detection, footnotes</p>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>Extension</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>fenced_code_gfm</td>
            <td>GFM fenced code blocks</td>
          </tr>
          <tr>
            <td>tables</td>
            <td>Pretty tables!</td>
          </tr>
          <tr>
            <td>def_list</td>
            <td>Definition lists</td>
          </tr>
          <tr>
            <td>attr_list</td>
            <td>Special attributes list for headers and fenced code blocks</td>
          </tr>
          <tr>
            <td>footnotes</td>
            <td>Footnotes</td>
          </tr>
          <tr>
            <td>smartypants</td>
            <td>SmartyPants</td>
          </tr>
          <tr>
            <td>newlines</td>
            <td>GFM newlines</td>
          </tr>
          <tr>
            <td>strikethrough</td>
            <td>GFM strikethrough</td>
          </tr>
          <tr>
            <td><em>smart_strong</em></td>
            <td>No strong emphasis in the middle of words</td>
          </tr>
          <tr>
            <td><em>abbr</em></td>
            <td>Abbreviations</td>
          </tr>
          <tr>
            <td><em>fenced_code</em></td>
            <td>PHP Markdown Extra fenced code blocks</td>
          </tr>
        </tbody>
      </table>
      <h3 id="pagedown-ace"><a href="https://github.com/benweet/pagedown-ace" title="Pagedown-Ace">PageDown Ace</a></h3>
      <p>This plugin combines the pagedown editor with the ace editor.</p>
      <p>The pagedown editor provides shortcut keys and a toolbar while the ace editor provides syntax hilighting and better typing experience (e.g. auto list extension), as well as collapseable blocks.</p>
      <h3 id="highlightjs"><a href="https://highlightjs.org/" title="Highlight.js">Highlight.js</a></h3>
      <p>Syntax highlighting for javascript</p>
      <p>I chose to use this as it’s very easy to use and I wanted to highlight the codeblocks</p>
      <h3 id="emojify"><a href="http://hassankhan.me/emojify.js/">Emojify</a></h3>
      <p>Turns text into emojis</p>
      <p>Pretty self explanatory</p>
      <h3 id="mathjax"><a href="https://www.mathjax.org/">MathJax</a></h3>
      <p>A javascript libary for writing mathematical formulas</p>
      <p>
        <script type="math/tex; mode=display" id="MathJax-Element-2"> \sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6} </script>
      </p>
      <p>It’s very easy to use, and is used by a popular site, StackExchange</p>
      <h3 id="fontawesome"><a href="http://fontawesome.io/">FontAwesome</a></h3>
      <p>A simple css library for icons. The icons are vectors so they scale well. All of the icons are free and of high quality.</p>
  </div>
</div>
{% endblock %}