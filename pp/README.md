PP-Macros
=========

“**The Pandoc-Goodies PP-Macros Library**” — An ongoing collaborative effort to build a library of PP macros to extend pandoc’s workflow: use GFM Task Lists in pandoc document, external syntax highlighters, and much more.

Copyright © Tristano Ajmone 2017, [MIT License](../LICENSE).

------------------------------------------------------------------------

<!-- #toc -->
-   [Introduction](#introduction)
    -   [About PP](#about-pp)
-   [Requirements](#requirements)
-   [Available Macros](#available-macros)
    -   [Highlight](#highlight)
    -   [GFM Task Lists](#gfm-task-lists)
    -   [GitHub Alerts](#github-alerts)
-   [Macros Documentation](#macros-documentation)

<!-- /toc -->

------------------------------------------------------------------------

Introduction
============

The [`macros`](./macros/) folder is the container of the pp-macros library. The library is a collection of various macros files, all ending with `.pp` extension (an arbitrary choice). Each file is a collection of macros for a specific topic. The separation of macros into different files is intended to facilitate selecting and discarding specific macros, and mixing them with macros from elsewhere.

The file [`macros.pp`](./macros/macros.pp) is the main macros file, which loads all other macros.

About PP
--------

PP is a text preprocessor designed by Christophe Delord ([@CDSoft](https://github.com/CDSoft)) for pandoc (and more generally Markdown and reStructuredText). PP ships with some very powerful built-in macros for literate programming, diagrams (GraphViz, PlantUML and ditaa), and running scripts inside markdown source.

But the great power of PP is it’s extensibility through user-created macros, branching and conditional statements.

PP is cross-platform and available as a single standalone binary file:

-   <https://github.com/CDSoft/pp>
-   <http://cdsoft.fr/pp/>

For some introductiory tutorials on using PP, see:

-   <https://github.com/tajmone/markdown-guide/tree/master/pp>

Requirements
============

The current macros library requires PP version &gt;= 1.4.

PP is evolving rapidly thanks to Christophe’s kind dedication to users features requests. Future versions of PP might break backward compatibility of some macros, but great effort is taken to ensure that the macros of ths library should always work with the latest release of PP.

You can download prebuilt binaries of the latest version of PP from the following link:

-   <http://cdsoft.fr/pp/#installation>

Or you can download and compile the sources (Haskell) of specific PP releases from GitHub:

-   <https://github.com/CDSoft/pp/releases>

Available Macros
================

Currently, only macros for HTML output are available. Some macros work only on Windows, but they will soon be fixed to work cross-platform.

Highlight
---------

    Highlight.pp

A set of macros for using André Simon’s Highlight tool:

-   <http://www.andre-simon.de/>
-   <https://github.com/andre-simon/highlight>

macros:

-   `!HighlightFile(FILE)(LANG)[(OPTIONS)]` — imports and syntax-highlights and external file. Output is a raw html `<pre><code>` block.
-   `!HighlightInlineTheme(THEME)` — retrives a Highlight theme and injects its CSS version into the documents. A quick solution for theming Highlight code withouth having to import an external CSS file via pandoc.

> **NOTES**: You can use Highlight along with pandoc’s built in syntax highlighter — pandoc only highlights markdown code blocks (fenced, or backticked) and will ignore the `<pre><code>` raw html blocks produced by Highlight.
>
> Pandoc automatically adds its own stylesheet for its highlighted code, the Highlight macro doesn’t.
>
> Pandoc highlighted source code uses different tags from Highlight, so their stylesheets won’t clash nor overlap.

GFM Task Lists
--------------

    GFM-TaskList.pp

A set of macros to enable GitHub [Task Lists](https://help.github.com/articles/basic-writing-and-formatting-syntax/#task-lists) in pandoc documents.

macros:

-   `!TaskList(LIST ELEMENTS)` — Genreated Task List enclosing tags.
-   `!(Task)(x)(ELEMENT CONTENTS)` — Generate a Task element.

Example usage:

    !TaskList(
    !Task[x][I'm a _checked_ task]
    !Task[ ][I'm an _unchecked_ task]
    )

> **NOTES**: Markdown syntax within Task’s `ELEMENT CONTENTS` will be rendered correctly, provided pandoc’s `markdown_in_html_blocks` extension is enabled (default in pandoc markdown).
>
> Task Lists can be nested, and will render properly in most browsers, even though the actual `<li>` tags will not be nested the proper way.

See [GitHub Pandoc HTML5 Template Preview](../templates/html5/github/GitHub-Template-Preview.html) for an example.

GitHub Alerts
-------------

    GFM-Alert.pp

A set of macros to create GitHub alerts (aka flash messages) within pandoc documents:

-   <http://primercss.io/alerts/>

macros:

-   `!GFMAlert(CONTENTS)`
-   `!GFMWarn(CONTENTS)`
-   `!GFMError(CONTENTS)`
-   `!GFMSuccess(CONTENTS)`

See [GitHub Pandoc HTML5 Template Preview](../templates/html5/github/GitHub-Template-Preview.html) for an example.

Macros Documentation
====================

*WIP! Coming soon…*

Documentation and usage examples for the macros library is still work in progress. Right now, to gain insight into the macros you can peek at the markdown source of the template preview, and the batch files used to convert it:

-   [`../templates/html5/github/src/`](../templates/html5/github/src/)

