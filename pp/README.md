PP-Macros
=========

“**The Pandoc-Goodies PP-Macros Library**” — An ongoing collaborative effort to build a library of PP macros to extend pandoc’s workflow: use GFM Task Lists in pandoc document, external syntax highlighters, and much more.

Copyright © Tristano Ajmone 2017, [MIT License](../LICENSE).

------------------------------------------------------------------------

**Table of Contents**

<!-- #toc -->
-   [Introduction](#introduction)
    -   [About PP](#about-pp)
-   [Requirements](#requirements)
-   [Available Macros](#available-macros)
    -   [GFM Task Lists](#gfm-task-lists)
    -   [GitHub Alerts](#github-alerts)
    -   [Highlight](#highlight)
    -   [Inline Formatting](#inline-formatting)
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

The current macros library requires PP version &gt;= 1.9.3.

PP is evolving rapidly thanks to Christophe’s kind dedication to users features requests. Future versions of PP might break backward compatibility of some macros, but great effort is taken to ensure that the macros of ths library should always work with the latest release of PP.

You can download prebuilt binaries of the latest version of PP from the following link:

-   <http://cdsoft.fr/pp/#installation>

Or you can download and compile the sources (Haskell) of specific PP releases from GitHub:

-   <https://github.com/CDSoft/pp/releases>

Available Macros
================

Currently, only macros for HTML output are available.

With the release of PP 1.7-2 macros that were Windows-only are now cross-platform.

GFM Task Lists
--------------

    GFM-TaskList.pp

A set of macros to enable GitHub [Task Lists](https://help.github.com/articles/basic-writing-and-formatting-syntax/#task-lists) in pandoc documents.

macros:

-   `!TaskList(LIST ELEMENTS)` — Genreated Task List enclosing tags.
-   `!Task(x| )(ELEMENT CONTENTS)` — Generate a Task element.
-   `!TaskListInlineCSS` — Inject required CSS

Example usage:

    !TaskList(
    !Task[x][I'm a _checked_ task]
    !Task[ ][I'm an _unchecked_ task]
    )

In order to hyde the list items’ bullet, so that only the checkbox is shown, you’ll need the CSS definitions found in the `GFM-TaskList.css` file. You have different options:

1.  Add its contents to your custom stylesheet.
2.  Tell pandoc to import it via the `--css` option — you can exploit the `%PP_MACROS_PATH%` env var: `--css %PP_MACROS_PATH%GFM-TaskList.css`
3.  Inject it as an inline stylesheet via the `!raw(!TaskListInlineCSS)` macro (a quick and universal solution, if you don’t mind CSS definitions within the document body).

Without these CSS definitions the task list will still look acceptable, but having both a bullet and a checkbox for each entry is redundant.

> **NOTES**: Markdown syntax within Task’s `ELEMENT CONTENTS` will be rendered correctly, provided pandoc’s `markdown_in_html_blocks` extension is enabled (default in pandoc markdown).
>
> Task Lists can be nested, and will render properly in most browsers, even though the actual `<li>` tags will not be nested the proper way.

See [GitHub Pandoc HTML5 Template Preview](../templates/html5/github/GitHub-Template-Preview.html) for an example.

GitHub Alerts
-------------

    GFM-Alerts.pp
    GFM-Alerts.css

A set of macros to create GitHub alerts (aka flash messages) within pandoc documents:

-   <http://primercss.io/alerts/>

macros:

-   `!GFMAlertsInlineCSS` — Inject required CSS
-   `!GFMAlert(CONTENTS)` — Default alert (blue)
-   `!GFMAlertPlain(CONTENTS)` — Plain alert (grey)
-   `!GFMError(CONTENTS)` — Error alert (red)
-   `!GFMWarn(CONTENTS)` — Warning alert (yellow)
-   `!GFMSuccess(CONTENTS)` — Success alert (green)

> **NOTE**: The “Plain” alert (`!GFMAlertPlain`) isn’t part of the original Primer-CSS alerts set. It was added to provide a more neutral, less appariscent alert box.

To render the alerts properly you’ll need the definitions found in “[`GFM-Alerts.css`](./macros/GFM-Alerts.css)”. You can either:

1.  Include “`GFM-Alerts.css`” in the final document via pandoc’s `--css` option — you can exploit the `%PP_MACROS_PATH%` env var: `--css %PP_MACROS_PATH%GFM-Alerts.css`
2.  Add the contents of “`GFM-Alerts.css`” to your pandoc template stylesheet.
3.  Use the `!GFMAlertsInlineCSS` macro to inject “`GFM-Alerts.css`” as an inline CSS definition in the final document.

Examples:

-   [`/test/GFM-Alerts.md`](./test/GFM-Alerts.md)
-   [`/test/GFM-Alerts.html`](./test/GFM-Alerts.html)
-   [GitHub Pandoc HTML5 Template Preview](../templates/html5/github/GitHub-Template-Preview.html)

Highlight
---------

    Highlight.pp

A set of macros for using André Simon’s Highlight tool:

-   <http://www.andre-simon.de/>
-   <https://github.com/andre-simon/highlight>

macros:

-   `!HighlightFile(FILE)(LANG)[(OPTIONS)]` — imports and syntax-highlights and external file. Output is a raw html `<pre><code>` block.
-   `!Highlight(LANG)([OPTIONS])(CODE)` — syntax-higlights the block of source code passed as `CODE` parameter (using lines of tildas instread of brackets; see Note below).
-   `!HighlightInlineTheme(THEME)` — retrives a Highlight theme and injects its CSS version into the documents. A quick solution for theming Highlight code withouth having to import an external CSS file via pandoc.

> **NOTE 1**: The `CODE` parameter is passed between lines of tildas instead of brackets:
>
>       !Highlight(LANG)(OPTIONS)
>       ~~~~~
>       CODE
>       ~~~~~
>       }
>
> From PP’s documentation:
>
> > The last argument can be enclosed between lines of tildas or backquotes (of the same length) instead of parenthesis, brackets or braces and. This is useful for literate programming, diagrams or scripts (see examples). Code block arguments are not stripped: spaces and blank lines are preserved.

<!-- -->
> **NOTE 2**: This macro creates and deletes a temporary file (named “`_pp-tempfileX.tmp`”, where `X` is a numeric counter) in the macros folder (`/pp/macros/`) for each macro call in the document, to temporarily store the code to highlight. The `X` counter is reset at each PP invocation.

<!-- -->
> **NOTE 3**: You can use Highlight along with pandoc’s built in syntax highlighter — pandoc only highlights markdown code blocks (fenced, or backticked) and will ignore the `<pre><code>` raw html blocks produced by Highlight.
>
> Pandoc automatically adds its own stylesheet for its highlighted code, the Highlight macro doesn’t.
>
> Pandoc highlighted source code uses different tags from Highlight, so their stylesheets won’t clash nor overlap.

Examples:

-   [`/test/Highlight.md`](./test/Highlight.md)
-   [`/test/Highlight.html`](./test/Highlight.html)

Inline Formatting
-----------------

    InlineFormatting.pp
    kbd_GitHub.css

A convenience set of shortcut-macros for various standard html inline elements:

-   `!kbd(KEY1)[(KEY2)(KEY3)(KEY4)]` — keystrokes in `<kbd>` tags.
-   `!kbdInlineCSS` — Inject required CSS (“`kbd_GitHub.css`”)

The `!kbd` macro can take from 1 to 4 parameters, each representing the text to show in the Keystroke.

Examples:

-   [`/test/InlineFormatting.md`](./test/InlineFormatting.md)
-   [`/test/InlineFormatting.html`](./test/InlineFormatting.html)

Macros Documentation
====================

*WIP! Coming soon…*

Documentation and usage examples for the macros library is still work in progress. Right now, to gain insight into the macros you should refer to the [`/test/`](./test/) folder, an peek at the markdown source of the template preview and the batch files used to convert it:

-   [`../templates/html5/github/src/`](../templates/html5/github/src/)

