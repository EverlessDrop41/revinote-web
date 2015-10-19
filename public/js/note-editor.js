//Note Editor
var converter = new Markdown.Converter();
var editor = new Markdown.Editor(converter);

editor.getConverter();
editor.run();