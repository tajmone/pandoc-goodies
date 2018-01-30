PP-Macros
=========

    PP v2.1.5 | pandoc v2.0.2

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

The [`/macros/`](./macros/) folder is the container of the pp-macros library. The library is a collection of various macros files, all ending with `.pp` extension (an arbitrary choice). Each file is a collection of macros for a specific topic. The separation of macros into different files is intended to facilitate selecting and discarding specific macros, and mixing them with macros from elsewhere.

The file [`macros.pp`](./macros/macros.pp) is the main macros file, which loads all other macros.

About PP
--------

PP is a text preprocessor designed by Christophe Delord ([@CDSoft](https://github.com/CDSoft)) for pandoc (and more generally Markdown and reStructuredText). PP ships with some very powerful built-in macros for literate programming, diagrams (GraphViz, PlantUML and ditaa), figures (Asymptote and R) and invoking scripts (Bash, Cmd, PowerShell, Python, Haskell and R) within markdown source files.

But the great power of PP is it’s extensibility through user-defined macros, branching and conditional statements.

PP is cross-platform and available as a single standalone binary file:

-   <https://github.com/CDSoft/pp>
-   <http://cdsoft.fr/pp/>
-   <http://cdsoft.fr/pp/download.html> — precompiled binaries (all releases)

For some introductiory tutorials on using PP, see:

-   <https://github.com/tajmone/markdown-guide/tree/master/pp>

Requirements
============

The current macros library requires PP version `>= 2.0`.

PP is evolving rapidly thanks to Christophe’s kind dedication to users' features requests. Future versions of PP might break backward compatibility of some macros, but great effort is taken to ensure that the macros of ths library should always work with the latest release of PP.

At the beginning of this page you find an opening line reporting the latest PP version used for testing the macros library. 

You can download prebuilt binaries of the latest version of PP from the following link:

-   <http://cdsoft.fr/pp/#installation>

Or you can download and compile the sources (Haskell) of specific PP releases from GitHub:

-   <https://github.com/CDSoft/pp/releases>

If you are looking for binaries of a specific release of PP, you can visit PP’s *Download Archive* page:

-   <http://cdsoft.fr/pp/download.html>

Available Macros
================

Currently, our PP macros library offers only macros targetting HTML output.

“**The Pandoc-Goodies PP-Macros Library**” is organized into separate module files (“pp-macros sets”), stored in the [`/macros/`](./macros/) folder:

-   `macros.pp` — the main module that loads all other modules:
    -   [`GFM-Alerts.pp`](#github-alerts) — [Live Demo Preview][Live GFM-Alerts]
    -   [`GFM-TaskList.pp`](#gfm-task-lists) — [Live Demo Preview][Live GFM-TaskList]
    -   [`Highlight.pp`](#highlight) — [Live Demo Preview][Live Highlight]
    -   [`InlineFormatting.pp`](#inline-formatting) — [Live Demo Preview][Live InlineFormatting]

> **NOTE**: Since the release of PP `v1.7-2` macros that were Windows-only are now cross-platform.

GFM Task Lists
--------------

    GFM-TaskList.pp

A set of macros to enable GitHub [Task Lists](https://help.github.com/articles/basic-writing-and-formatting-syntax/#task-lists) in pandoc documents.

> __NOTE__ — A new __[task-list Lua filter]__ is now available at the __[lua-filters]__ pandoc project, allowing the use of GFM Task Lists in pandoc documents. This filter implements Task Lists via pandoc's AST, extending support of task lists to various input/output formats. It's therefore advisable to use the new __task-list__ filter instead of these PP macros (cleaner syntax and improved portability).

macros:

-   `!TaskList( LIST ELEMENTS )` — Genreate Task List enclosing-tags.
-   `!Task(x| )( TASK TEXT )[( SUB-TASKLIST )]` — Generate a Task element and (optionally) initiate a sub-list.
-   `!TaskListInlineCSS` — Inject required CSS.

> **NOTE**: Using square brackets for `!Task` parameters is adviced since it resembles the GFM syntax.

Example usage:

    !TaskList
    ~~~~~~~~~~~~~~~~~~~~~~~
    !Task[x][I'm a _checked_ task]
    !Task[ ][I'm an _unchecked_ task]
    ~~~~~~~~~~~~~~~~~~~~~~~

Example of a nested Task List:

    !TaskList
    ~~~~~~~~~~~~~~~~~~~~~~~
    !Task[ ][Task 1][
      !Task[x][SubTask 1]
      !Task[ ][SubTask 2][
        !Task[x][Sub-SubTask 1]]]
    !Task[x][Task 2]
    ~~~~~~~~~~~~~~~~~~~~~~~

… or, using fences to wrap last parameters, instead of brackets:

    !TaskList
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    !Task[ ][Task 1]
    ~~~~~~~~~~~~~~~~~~~~~~~~
    !Task[x][SubTask 1]
    !Task[ ][SubTask 2]
    ~~~~~~~~~~~~~~~~~~~
    !Task[x][Sub-SubTask 1]
    ~~~~~~~~~~~~~~~~~~~
    ~~~~~~~~~~~~~~~~~~~~~~~~
    !Task[ ][Task 2]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In order to hyde the list items’ bullet (so that only the checkbox is shown) you’ll need the CSS definitions found in the `GFM-TaskList.css` file. You have different options:

1.  Add its contents to your custom stylesheet.
2.  Tell pandoc to import it via the `--css` option — you can exploit the `%PP_MACROS_PATH%` env var: `--css %PP_MACROS_PATH%GFM-TaskList.css`
3.  Inject it as an inline stylesheet via the `!raw(!TaskListInlineCSS)` macro (a quick and universal solution, if you don’t mind CSS definitions within the document body).

Without these CSS definitions the task list will still look acceptable, but having both a bullet and a checkbox for each entry is redundant.

> **NOTES**: Markdown syntax within Task’s `TASK TEXT` will be rendered correctly, provided pandoc’s `markdown_in_html_blocks` extension is enabled (default in pandoc markdown).
>
> Since “`GFM-TaskList.pp`” v2.0, nested Task Lists are rendered in the final HTML the proper way — ie: `<ul>` and `<li>` tags are nested in a syntactically correct manner.

Examples:

-   [`/test/GFM-TaskList.md`](./test/GFM-TaskList.md)
-   [`/test/GFM-TaskList.html`](./test/GFM-TaskList.html) — [Live Demo Preview][Live GFM-TaskList]
-   [GitHub Pandoc HTML5 Template Local Preview]
-   [GitHub Pandoc HTML5 Template Live Preview]

GitHub Alerts
-------------

    GFM-Alerts.pp
    GFM-Alerts.css

A set of macros to create GitHub alerts (aka flash messages) within pandoc documents:

-   <http://primercss.io/archive/alerts/>

macros:

-   `!GFMAlertsInlineCSS` — Inject required CSS
-   `!GFMAlert( CONTENTS )` — **Alert** (blue)
-   `!GFMError( CONTENTS )` — **Warning** (red)
-   `!GFMWarn( CONTENTS )` — **Error** (yellow)
-   `!GFMSuccess( CONTENTS )` — **Success** (green)
-   `!GFMAlertNote( CONTENTS )` — **Note** (grey)
-   `!GFMAlertPlain( CONTENTS )` — same as Note (alias of `!GFMAlertNote`)

> **CHANGES** --- Since `GFM-Alerts.pp` v2.1 the HTML tags and the CSS produced by these macros have changed: Alerts are now wrapped in a single `<div>`, and class names have changed.
> 
> Also, the new `!GFMAlertNote` macro replaces `!GFMAlertPlain` (which is kept as an alias).
> 
> The changes are backward compatible, so you don't need to change your  documents to keep using them.


To render the alerts properly you’ll need the definitions found in “[`GFM-Alerts.css`](./macros/GFM-Alerts.css)”. You can either:

1.  Include “`GFM-Alerts.css`” in the final document via pandoc’s `--css` option — you can exploit the `%PP_MACROS_PATH%` env var: `--css %PP_MACROS_PATH%GFM-Alerts.css`
2.  Add the contents of “`GFM-Alerts.css`” to your pandoc template stylesheet.
3.  Use the `!GFMAlertsInlineCSS` macro to inject “`GFM-Alerts.css`” as an inline CSS definition in the final document.

>  __PANDOC v2 FENCED DIVS__ --- Pandoc v2.x users are adviced to use the new [fenced divs] syntax instead of these PP macros: fenced divs offer finer control over the final HTML, and pandoc can convert them to other formats too (unlike raw HTML injected into markdown source). The final result is exactly the same. See [`/test/GFM-Alerts.html`][Live Fenced Divs] for an example and more details.
>  
>  As for other markdown flavours or tools, these macros will continue to be useful. And of course, the  `!GFMAlertsInlineCSS` remains useful for all users.

[fenced divs]: http://pandoc.org/MANUAL.html#extension-fenced_divs "Link to pandoc documentation on 'fenced-divs'"

[Live Fenced Divs]: http://htmlpreview.github.io/?https://github.com/tajmone/pandoc-goodies/blob/master/pp/test/GFM-Alerts.html#pandoc-new-fenced-divs "HTML Live Preview of GFM-Alerts vs pandoc fenced divs"

<!--      -->

> **NOTE** --- The "Note" alert (alias “Plain”, grey colors) isn’t part of the original Primer-CSS alerts set. It was added to provide a more neutral, less appariscent alert box.

Examples:

-   [`/test/GFM-Alerts.md`](./test/GFM-Alerts.md)
-   [`/test/GFM-Alerts.html`](./test/GFM-Alerts.html) — [Live Demo Preview][Live GFM-Alerts]
-   [GitHub Pandoc HTML5 Template Local Preview]
-   [GitHub Pandoc HTML5 Template Live Preview]

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
>       !Highlight( LANG )( OPTIONS )
>       ~~~~~
>       CODE
>       ~~~~~
>       }
>
> From PP’s documentation:
>
> > The last argument can be enclosed between lines of tildas or backquotes (of the same length) instead of parenthesis, brackets or braces and. This is useful for literate programming, diagrams or scripts (see examples). Code block arguments are not stripped: spaces and blank lines are preserved.

<!-- -->
> **NOTE 2**: This macro, when run inside Windows CMD, creates a temporary file (named “`_pp-tempfileX.tmp`”, where `X` is a numeric counter) in the macros folder (`/pp/macros/`) for each macro call in the document, to temporarily store the code to highlight. At each PP invocation the `X` counter is reset, and the previous temp files are written over. These temporary files are set to be ignored by Git, so you shouldn’t worry about them.
>
> When run inside Shell/Bash (including Git Bash for Windows) it doesn’t write any temporary files to disk.

<!-- -->
> **NOTE 3**: You can use Highlight along with pandoc’s built in syntax highlighter — pandoc only highlights markdown code blocks (fenced, or backticked) and will ignore the `<pre><code>` raw html blocks produced by Highlight.
>
> Pandoc automatically adds its own stylesheet for its highlighted code, the Highlight macro doesn’t.
>
> Pandoc highlighted source code uses different tags from Highlight, so their stylesheets won’t clash nor overlap.

Examples:

-   [`/test/Highlight.md`](./test/Highlight.md)
-   [`/test/Highlight.html`](./test/Highlight.html) — [Live Demo Preview][Live Highlight]

Inline Formatting
-----------------

    InlineFormatting.pp
    kbd_GitHub.css

A convenience set of shortcut-macros for various standard html inline elements:

-   `!kbd( KEY1 )[( KEY2 )( KEY3 )( KEY4 )]` — keystrokes in `<kbd>` tags.
-   `!kbdInlineCSS` — Inject required CSS (“`kbd_GitHub.css`”)

The `!kbd` macro can take from 1 to 4 parameters, each representing the text to show in the Keystroke.

Examples:

-   [`/test/InlineFormatting.md`](./test/InlineFormatting.md)
-   [`/test/InlineFormatting.html`](./test/InlineFormatting.html) — [Live Demo Preview][Live InlineFormatting]

Macros Documentation
====================

*WIP! Coming soon…*

Documentation and usage examples for the macros library is still work in progress. Right now, to gain insight into the macros you should refer to the [`/test/`](./test/) folder, an peek at the markdown source of the template preview and the batch files used to convert it:

-   [`../templates/html5/github/src/`](../templates/html5/github/src/)

[Live Highlight]: http://htmlpreview.github.io/?https://github.com/tajmone/pandoc-goodies/blob/master/pp/test/Highlight.html "Live HTML Preview of Highlight PP-Macros Test"

[Live InlineFormatting]: http://htmlpreview.github.io/?https://github.com/tajmone/pandoc-goodies/blob/master/pp/test/InlineFormatting.html "Live HTML Preview of Inline Formatting PP-Macros Test"

[Live GFM-TaskList]: http://htmlpreview.github.io/?https://github.com/tajmone/pandoc-goodies/blob/master/pp/test/GFM-TaskList.html "Live HTML Preview of GFM-TaskList PP-Macros Test"

[Live GFM-Alerts]: http://htmlpreview.github.io/?https://github.com/tajmone/pandoc-goodies/blob/master/pp/test/GFM-Alerts.html "Live HTML Preview of GFM-Alerts PP-Macros Test"

[GitHub Pandoc HTML5 Template Live Preview]: http://htmlpreview.github.io/?https://github.com/tajmone/pandoc-goodies/blob/master/templates/html5/github/GitHub-Template-Preview.html "Live HTML Preview of GitHub Pandoc HTML5 Template"

[GitHub Pandoc HTML5 Template Local Preview]: ../templates/html5/github/GitHub-Template-Preview.html "Local Preview of GitHub Pandoc HTML5 Template"


[task-list lua filter]: https://github.com/pandoc/lua-filters/tree/master/task-list "Visit 'task-list' lua filter project page"

[lua-filters]: https://github.com/pandoc/lua-filters "Visit lua-filters repository"
