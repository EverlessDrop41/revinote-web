Revinote Web
==

Revinote is a note making app, aimed at making notes for revision easier. It uses Firebase, which allows all notes to be synced in realtime accross all devices

## Backened

### [Node.js](https://nodejs.org/en/)

A Framework that allows javascript to run in a desktop environment

I chose node because of it's popularity (so it has a lot of packages) and that I already know javascript so it's quite easy to learn

### [Express.js](http://expressjs.com/)

A Library that makes creating a web server a lot easier. 

I chose this because it speeds up the development process and there was no need for something more optimised. Another advantage is that it's very popular thus well documented

### [Firebase](https://www.firebase.com/)

A realtime database system

I chose to use firebase because the app will be cross platform. Firebase provides an api for many platforms so this will make developing for other platforms easier.

The server uses Firebase to login but most of the data handling is done on the front end.

### [Swig](http://paularmstrong.github.io/swig/)

An node templating language.

I chose this because I like the syntax of it and I had prior experience with it. Upon reflection I would probably 

### [Cookie Session](https://www.npmjs.com/package/cookie-session)

This is a simple library for express that handles session data. My reasons for using this are pretty self explanatory.

### [Body-Parser](https://www.npmjs.com/package/body-parser)

An express library that makes getting request data easier

## Front End

### [Bootstrap 3](https://getbootstrap.com/)

> Bootstrap is the most popular HTML, CSS, and JS framework for developing responsive, mobile first projects on the web.

I used bootstrap as my U.I. framework as it made prototyping a lot easier and attractive. This choice was purely for speed. Due to it's popularity and me using a CDN it shouldn't affect the load times as the user will cache a copy from previous sites

### [jQuery](https://jquery.com/)

> jQuery is a fast, small, and feature-rich JavaScript library. It makes
> things like HTML document traversal and manipulation, event handling,
> animation, and Ajax much simpler with an easy-to-use API that works
> across a multitude of browsers. With a combination of versatility and
> extensibility, jQuery has changed the way that millions of people
> write JavaScript.

I chose to use jQuery because it makes interacting with the DOM a lot easier, it also includes some animations

### [PageDown](https://code.google.com/p/pagedown/)

PageDown is a popular javascript library for working with markdown. It includes a converter and an editor.

All notes are formatted with markdown

I chose this because it's easy to work with, and it is used by popular sites such as StackExchange

### [Pagedown Extra](https://github.com/jmcmanus/pagedown-extra)

A collection of plugins for Pagedown to enable mardown extra features. These features include things like tables, better paragraph detection, footnotes

| Extension       | Description |
| --------------- | ----------- |
| fenced_code_gfm | GFM fenced code blocks |
| tables          | Pretty tables! |
| def_list        | Definition lists |
| attr_list       | Special attributes list for headers and fenced code blocks |
| footnotes       | Footnotes |
| smartypants     | SmartyPants |
| newlines        | GFM newlines |
| strikethrough   | GFM strikethrough |
| *smart_strong*  | No strong emphasis in the middle of words |
| *abbr*          | Abbreviations |
| *fenced_code*   | PHP Markdown Extra fenced code blocks |

### [Highlight.js](https://highlightjs.org/ "Highlight.js")
Syntax highlighting for javascript

I chose to use this as it's very easy to use and I wanted to highlight the codeblocks

### [Emojify](http://hassankhan.me/emojify.js/)

Turns text into emojis

Pretty self explanatory

### [MathJax](https://www.mathjax.org/)

A javascript libary for writing mathematical formulas

$$ \sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6} $$

It's very easy to use, and is used by a popular site, StackExchange

### [FontAwesome](http://fontawesome.io/)

A simple css library for icons. The icons are vectors so they scale well. All of the icons are free and of high quality.
