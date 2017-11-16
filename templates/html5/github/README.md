GitHub Pandoc HTML5 Template
============================

    pandoc v1.19.2

A pandoc html5 template mimicking GitHub’s documents preview. Supports extended GitHub Flavored Markdown features through custom pp-macros that leverage Raw HTML and GitHub’s CSS.

-   [Live GitHub HTML Preview](http://htmlpreview.github.io/?https://github.com/tajmone/pandoc-goodies/blob/master/templates/html5/github/GitHub-Template-Preview.html)

------------------------------------------------------------------------

**Table of Contents**

<!-- #toc -->
-   [Features](#features)
-   [License](#license)
-   [Credits](#credits)
    -   [GitHub Markdown CSS](#github-markdown-css)
    -   [Primer CSS](#primer-css)
-   [Changelog](#changelog)

<!-- /toc -->

------------------------------------------------------------------------

Features
========

This html5 pandoc template will format your documents using GitHub’s stylesheets. Beside covering the standard markdown elements, this template also supports some of GitHub’s extra HTML styling:

-   [<mark>Inline highlighter</mark>](http://primercss.io/type/#inline-text-elements) via `<mark>` tag
-   Keystrokes via `<kbd>` tag (eg: <kbd>Ctrl</kbd>+<kbd>Z</kbd>)
-   [Task lists](https://help.github.com/articles/basic-writing-and-formatting-syntax/#task-lists)
-   [Alerts](http://primercss.io/alerts/) (aka Flash messages)

These elements can be integrated in pandoc source documents via our custom pp-macros for generating Raw HTML elements. For example, you can now use GFM Task Lists in your pandoc documents via the following pp-macros:

    !TaskList(
    !Task[x][I'm a _checked_ task]
    !Task[ ][I'm an _unchecked_ task]
    )

… which will be preprocessed to Raw HTML:

``` html
<ul class="task-list">
<li class="task-list-item">
<input type="checkbox" disabled="" checked="" />I’m a <em>checked</em> task
</li>
<li class="task-list-item">
<input type="checkbox" disabled="" />I’m an <em>unchecked</em> task
</li>
</ul>
```

… and will render in previews as:

<ul class="task-list">
<li class="task-list-item">
<input type="checkbox" disabled="" checked="" />I’m a <em>checked</em> task
</li>
<li class="task-list-item">
<input type="checkbox" disabled="" />I’m an <em>unchecked</em> task
</li>
</ul>
License
=======

-   [LICENSE](./LICENSE)

**GitHub HTML5 Panodc Template** is Copyright © Tristano Ajmone, 2017, released under [The MIT License](./LICENSE) (MIT).

Credits
=======

This template is build on top of [Sindre Sorhus](https://github.com/sindresorhus)’ **GitHub Markdown CSS**, plus some CSS modules taken from [GitHub](https://github.com) Incorporation’s **Primer CSS**:

-   [GitHub Markdown CSS](https://sindresorhus.com/github-markdown-css)
-   [Primer-CSS](http://primercss.io/)

GitHub Markdown CSS
-------------------

**GitHub Markdown CSS** is Copyright © Sindre Sorhus, released under [The MIT License](https://github.com/sindresorhus/github-markdown-css/blob/gh-pages/readme.md) (MIT).

These template files are derivatives from **GitHub Markdown CSS**:

-   [`src/github-markdown.css`](./src/github-markdown.css) (adapted from [`github-markdown.css`](https://github.com/sindresorhus/github-markdown-css/blob/gh-pages/github-markdown.css))
-   [`src/markdown-body.css`](./src/markdown-body.css) (taken from [`readme.md`](https://github.com/sindresorhus/github-markdown-css/blob/gh-pages/readme.md))

Primer CSS
----------

**Primer CSS** is Copyright © 2016 GitHub Inc., released under [The MIT License](https://github.com/primer/primer-css/blob/master/LICENSE) (MIT).

These template files are derivatives from the **Primer CSS** project’s modules:

-   [`src/alerts.css`](./src/alerts.css) (taken from [`flash.scss`](https://github.com/primer/primer-alerts/blob/master/lib/flash.scss))

Changelog
=========

-   **v1.1** (2017-04-10)
    -   Added new custom Alert class “`flash-plain`” with greyish colors. (pp-macro: `!GFMAlertPlain()`).
-   **v1.0** (2017-04-09)
    -   First release.

