{% extends 'layout.swig' %}

{% block content %}
<div class="container">
	<div class="row">
    <h1 id="header-one">Header One</h1>
    <pre class="prettyprint">
<code class=" hljs asciidoc"><span class="hljs-header">Header One
=========</span></code></pre>
    <p>or</p>
    <pre class="prettyprint">
<code class="language-Markdown hljs vala"><span class=
"hljs-preprocessor"># Header One</span></code></pre>
    <h2 id="header-two">Header Two</h2>
    <pre class="prettyprint">
<code class=" hljs asciidoc"><span class="hljs-header">Header Two
----------</span></code></pre>
    <p>or</p>
    <pre class="prettyprint">
<code class="language-Markdown hljs vala"><span class=
"hljs-preprocessor">## Header Two</span></code></pre>
    <h3 id="header-three">Header Three</h3>
    <pre class="prettyprint">
<code class="language-Markdown hljs vala"><span class=
"hljs-preprocessor">### Header Three</span></code></pre>
    <h4 id="header-four">Header Four</h4>
    <pre class="prettyprint">
<code class="language-Markdown hljs vala"><span class=
"hljs-preprocessor">#### Header Four</span></code></pre>
    <h5 id="header-five">Header Five</h5>
    <pre class="prettyprint">
<code class="language-Markdown hljs vala"><span class=
"hljs-preprocessor">##### Header Five</span></code></pre>
    <h6 id="header-six">Header Six</h6>
    <pre class="prettyprint">
<code class="language-Markdown hljs vala"><span class=
"hljs-preprocessor">###### Header Six</span></code></pre>
    <hr>
    <p>Line Break (As above)</p>
    <pre class="prettyprint">
<code class=" hljs brainfuck"><span class="hljs-literal">-</span><span class=
"hljs-literal">-</span><span class="hljs-literal">-</span></code></pre>
    <hr>
    <h2 id="text-decoration">Text Decoration</h2>
    <p>I am <strong>bold</strong>, <em>italic</em> and
    <strong><em>both</em></strong> another, <em>italic</em> and another
    <strong>bold</strong> and another <strong><em>both</em></strong></p>
    <pre class="prettyprint">
<code class=" hljs markdown">I am <span class=
"hljs-strong">**bold**</span>, <span class=
"hljs-emphasis">*italic*</span> and <span class=
"hljs-strong">***both**</span>* another <span class=
"hljs-emphasis">_italic_</span> and another <span class=
"hljs-strong">__bold__</span> and another <span class=
"hljs-strong">___both__</span>_</code></pre>
    <hr>
    <h2 id="lists">Lists</h2>
    <ul>
        <li>bullets can be <code>-</code>, <code>+</code>, or
        <code>*</code></li>
        <li>bullet list 1</li>
        <li>
            <p>bullet list 2</p>
            <ul>
                <li>sub item 1</li>
                <li>
                    <p>sub item 2</p>
                    <p>with indented text inside</p>
                </li>
            </ul>
        </li>
        <li>
            <p>bullet list 3</p>
        </li>
        <li>bullet list 4</li>
        <li>bullet list 5</li>
    </ul>
    <pre class="prettyprint">
<code class=" hljs haml"> -<span class=
"ruby"> bullets can be `-`, `+`, <span class="hljs-keyword">or</span> `*`
</span> -<span class="ruby"> bullet list <span class="hljs-number">1</span>
</span> -<span class="ruby"> bullet list <span class="hljs-number">2</span>
</span>    -<span class="ruby"> sub item <span class="hljs-number">1</span>
</span>    -<span class="ruby"> sub item <span class="hljs-number">2</span>
</span>
        with indented text inside

 -<span class="ruby"> bullet list <span class="hljs-number">3</span>
</span> + bullet list 4
 * bullet list 5</code></pre>
    <hr>
    <h2 id="links">Links</h2>
    <p>This is an <a href="http://lmgtfy.com/">example inline link</a> and
    <a href="http://lmgtfy.com/" title="Hello, world">another one with a
    title</a>.</p>
    <p>Links can also be reference based : <a href=
    "http://revolunet.com">reference 1</a> or <a href="http://revolunet.com"
    title="rich web apps">reference 2 with title</a>.</p>
    <p>References are usually placed at the bottom of the document</p>
    <pre class="prettyprint">
<code class=" hljs markdown">This is an [<span class=
"hljs-link_label">example inline link</span>](<span class=
"hljs-link_url">http://lmgtfy.com/</span>) and [<span class=
"hljs-link_label">another one with a title</span>](<span class=
"hljs-link_url">http://lmgtfy.com/ "Hello, world"</span>).

Links can also be reference based : [<span class=
"hljs-link_label">reference 1</span>][<span class=
"hljs-link_reference">ref1</span>] or [<span class=
"hljs-link_label">reference 2 with title</span>][<span class=
"hljs-link_reference">ref2</span>].

References are usually placed at the bottom of the document

 [ref1]: http://revolunet.com
 [ref2]: http://revolunet.com "rich web apps"</code></pre>
    <hr>
    <h2 id="footnotes">Footnotes</h2>
    <p>Footnotes are always put to the bottom of the document</p>
    <p>This is a paragraph with a footnote <a class="footnote" href=
    "#fn:note-id" id="fnref:note-id" title="See footnote">1</a></p>
    <pre class="prettyprint">
<code class=" hljs applescript">This <span class=
"hljs-keyword">is</span> a <span class=
"hljs-property">paragraph</span> <span class=
"hljs-keyword">with</span> a footnote [^note-<span class=
"hljs-property">id</span>]

[^note-<span class="hljs-property">id</span>]: This <span class=
"hljs-keyword">is</span> <span class="hljs-keyword">the</span> <span class=
"hljs-type">text</span> <span class="hljs-keyword">of</span> <span class=
"hljs-keyword">the</span> note. </code></pre>
    <hr>
    <h2 id="indentation">Indentation</h2>
    <p>Indentation is popular for quotes</p>
    <blockquote>
        <p>Here is some indented text</p>
        <blockquote>
            <blockquote>
                <p>Super Indent</p>
                <blockquote>
                    <p>Super Super Indent</p>
                    <blockquote>
                        <p>Super Super Super Indent</p>
                    </blockquote>
                </blockquote>
            </blockquote>
            <p>even more indented<br>
            Need gap to stop indenting</p>
        </blockquote>
        <p>Less indented<br>
        Still indented</p>
    </blockquote>
    <pre class="prettyprint">
<code class=" hljs scss">&gt; Here is some indented <span class=
"hljs-value">text</span>
&gt;&gt;&gt; <span class="hljs-value">Super</span> Indent
&gt;&gt;&gt;&gt; <span class="hljs-value">Super</span> <span class=
"hljs-value">Super</span> Indent
&gt;&gt;&gt;&gt;&gt; <span class="hljs-value">Super</span> <span class=
"hljs-value">Super</span> <span class="hljs-value">Super</span> Indent
&gt;&gt;
&gt;&gt; even more indented
&gt; Need gap to stop indenting
&gt; 
&gt; Less indented
Still indented</code></pre>
    <hr>
    <h2 id="images">Images</h2>
    <p>A sample image :</p>
    <p><img alt="revolunet logo" src=
    "http://www.revolunet.com/static/parisjs8/img/logo-revolunet-carre.jpg"
    title="revolunet logo"></p>
    <p>As links, images can also use references instead of inline links :</p>
    <p><img alt="revolunet logo" src=
    "http://www.revolunet.com/static/parisjs8/img/logo-revolunet-carre.jpg"
    title="revolunet logo"></p>
    <pre class="prettyprint">
<code class=" hljs markdown">![<span class=
"hljs-link_label">revolunet logo</span>](<span class=
"hljs-link_url">http://www.revolunet.com/static/parisjs8/img/logo-revolunet-carre.jpg "revolunet logo"</span>)

As links, images can also use references instead of inline links :

![<span class="hljs-link_label">revolunet logo</span>][<span class=
"hljs-link_reference">revolunet-logo</span>]

[<span class="hljs-link_reference">revolunet-logo</span>]:<span class=
"hljs-link_url"> http://www.revolunet.com/static/parisjs8/img/logo-revolunet-carre.jpg "revolunet logo"</span></code></pre>
    <hr>
    <h2 id="table">Table</h2>
    <table>
        <thead>
            <tr>
                <th>Left Header</th>
                <th align="center">Center Header</th>
                <th align="right">Right Header</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Default</td>
                <td align="center">center</td>
                <td align="right">Right</td>
            </tr>
        </tbody>
    </table>
    <pre class="prettyprint">
<code class=
"language-Markdown hljs haml">| Left Header | Center Header | Right Header
-<span class="ruby">--|<span class="hljs-symbol">:-</span><span class=
"hljs-symbol">:|--</span><span class="hljs-symbol">:</span>
</span>| Default | center | Right |</code></pre>
    <hr>
    <h2 id="code">Code</h2>
    <p>There are two types, multiline and inline code</p>
    <p>Multiline code is highlighted using <a href=
    "https://highlightjs.org/">highlight.js</a></p>
    <pre class="prettyprint">
<code class="language-js hljs"><span class=
"hljs-comment">//Multi line code</span>
<span class="hljs-function"><span class=
"hljs-keyword">function</span> <span class=
"hljs-title">HelloWorld</span><span class="hljs-params">()</span> {</span>
    alert(<span class="hljs-string">"Helllo, World!"</span>);
}</code></pre>
    <pre class="prettyprint">
<code class=" hljs coffeescript"> `<span class=
"javascript"></span>``<span class="javascript">js
 <span class="hljs-comment">//Multi line code</span>
 <span class="hljs-function"><span class=
"hljs-keyword">function</span> <span class=
"hljs-title">HelloWorld</span><span class="hljs-params">()</span> {</span>
    alert(<span class="hljs-string">"Helllo, World!"</span>);
 }
 </span>``<span class="javascript"></span>`</code></pre>
    <p>or</p>
    <p><code>/*Single line code*/ .bg-red { background-color: red }</code></p>
    <pre class="prettyprint">
<code class=" hljs css">`<span class=
"hljs-comment">/*Single line code*/</span> <span class=
"hljs-class">.bg-red</span> <span class="hljs-rules">{ <span class=
"hljs-rule"><span class="hljs-attribute">background-color</span>:<span class=
"hljs-value"> red </span></span></span>}`</code></pre>
    <hr>
    <h2 id="emojis">Emojis</h2>
    <p>:smile:</p>
    <pre class="prettyprint">
<code class=" hljs ruby"><span class="hljs-symbol">:smile</span><span class=
"hljs-symbol">:</span></code></pre>
    <p>or</p>
    <pre class="prettyprint">
<code class=" hljs css"><span class="hljs-pseudo">:)</span></code></pre>
    <p>See full list of emojis <a href=
    "http://www.emoji-cheat-sheet.com/">here</a></p>
    <hr>
    <h2 id="mathjax">MathJax</h2>
    <p>
    <script id="MathJax-Element-43" type="math/tex; mode=display">
    \sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6} 
    </script></p>
    <p>Inline Equation 
    <script id="MathJax-Element-44" type="math/tex">
    \sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6} 
    </script></p>
    <pre class="prettyprint">
<code class=" hljs matlab">$$ \sum_<span class="hljs-cell">{i=<span class=
"hljs-number">0</span>}</span>^n <span class=
"hljs-built_in">i</span>^<span class="hljs-number">2</span> = \frac<span class=
"hljs-cell">{(n^<span class="hljs-number">2</span>+n)(<span class=
"hljs-number">2</span>n+<span class="hljs-number">1</span>)}</span><span class=
"hljs-cell">{<span class="hljs-number">6</span>}</span> $$

Inline Equation $ \sum_<span class="hljs-cell">{i=<span class=
"hljs-number">0</span>}</span>^n <span class=
"hljs-built_in">i</span>^<span class="hljs-number">2</span> = \frac<span class=
"hljs-cell">{(n^<span class="hljs-number">2</span>+n)(<span class=
"hljs-number">2</span>n+<span class="hljs-number">1</span>)}</span><span class=
"hljs-cell">{<span class="hljs-number">6</span>}</span> $</code></pre>
    <p>MathJax allows you to write beautiful looking formulas in markdown. For
    a tutorial on how to use it, look <a href=
    "http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference">
    here</a></p>
    <div class="footnotes">
        <hr>
        <ol>
            <li id="fn:note-id">This is the text of the note. <a class=
            "reversefootnote" href="#fnref:note-id" title="Return to article">
                ↩</a>
            </li>
        </ol>
    </div>
	</div>
</div>

<script type="text/javascript">
	 emojify.setConfig({img_dir: 'http://hassankhan.me/emojify.js/images/emoji'});
		  emojify.run();
</script>
{% endblock %}