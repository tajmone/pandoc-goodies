# GitHub Pandoc HTML5 Template

    GitHub Template v2.1 (2018/02/28) | pandoc v2.1.1

A pandoc html5 template mimicking GitHub’s documents preview. Supports extended GitHub Flavored Markdown features through custom pp-macros that leverage Raw HTML and GitHub’s CSS.

  - [Live GitHub HTML Preview](http://htmlpreview.github.io/?https://github.com/tajmone/pandoc-goodies/blob/master/templates/html5/github/GitHub-Template-Preview.html)


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="true" lowercase_only_ascii="true" uri_encoding="true" depth="3" -->

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)
- [Credits](#credits)
  - [GitHub Markdown CSS](#github-markdown-css)
  - [Primer CSS](#primer-css)
- [Changelog](#changelog)

<!-- /MarkdownTOC -->

-----



# Features

This html5 pandoc template will format your documents using CSS based on GitHub’s stylesheets. Beside covering the standard pandoc markdown elements, this template also supports some of GitHub’s extra HTML styling:

  - [<mark>Inline highlighter</mark>](http://primercss.io/type/#inline-text-elements) via `<mark>` tag
  - Keystrokes via `<kbd>` tag (eg: <kbd>Ctrl</kbd>+<kbd>Z</kbd>)
  - [Task lists](https://help.github.com/articles/basic-writing-and-formatting-syntax/#task-lists)
  - [Alerts](http://primercss.io/archive/alerts/) (aka Flash messages)

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

… and in the final document they will be rendered like on GitHub.

For a live preview, and the full list of template features, see:

  - [Live GitHub HTML Preview](http://htmlpreview.github.io/?https://github.com/tajmone/pandoc-goodies/blob/master/templates/html5/github/GitHub-Template-Preview.html)

# Installation

In order to make the template available to pandoc system-wide, it should be copied to the `templates` subfolder in pandoc's data dir — on Windows, that would be `%APPDATA%\pandoc\templates\`; on \*nix it would be `~/.pandoc/templates/`. If you haven't installed any templates before, you'll have to create the `templates` folder yourself.

On Windows, you can install/update the GitHub template via the batch script found in this folder:

- [`INSTALL.bat`](./INSTALL.bat)

Run it from the CMD or the File Explorer. The script will ask for confirmation before actually installing the template.

# Usage

Once the GitHub template is installed to pandoc's templates folder, you'll be able to use it from anywhere via the `--template=` option.

Example:

```bat
pandoc --template=GitHub.html5 FILENAME.md -o FILENAME.html
```

The GitHub template is a fully self-contained single-file template (no external stylesheets, all CSS is embedded in the template), therefore the output HTML file it produces can be distributed without need of any dependencies.

But if the document you are converting relies on external resources (images, additional CSS files, etc), and you want to produce a single-file HTML document, than you should use the `--self-contained` option:

```bat
pandoc --template=GitHub.html5 --self-contained FILENAME.md -o FILENAME.html
```

The `--self-contained` option will make pandoc use `data:` URIs to incorporate into the final document the contents of linked scripts, stylesheets, images, and videos. The advantage of a self-contained document is that it can be moved around as a single-file without breaking it. The downside is document size and redundancy: `data:` URIs resources are larger in size, and resources which appear more than once in the same document will be converted to a full `data:` URI at each occurence — for large images occuring more than once, this could be an issue.

> __NOTE__ — the `--template` option already implies `--standalone`.


# License

  - [LICENSE](./LICENSE)

**GitHub HTML5 Panodc Template** is Copyright © Tristano Ajmone, 2017, released under [The MIT License](./LICENSE) (MIT):

    MIT License
    
    Copyright (c) Tristano Ajmone, 2017 (github.com/tajmone/pandoc-goodies)
    Copyright (c) Sindre Sorhus <sindresorhus@gmail.com> (sindresorhus.com)
    Copyright (c) 2017 GitHub Inc.
    
    "GitHub Pandoc HTML5 Template" is Copyright (c) Tristano Ajmone, 2017, released
    under the MIT License (MIT); it contains readaptations of substantial portions
    of the following third party softwares:
    
    (1) "GitHub Markdown CSS", Copyright (c) Sindre Sorhus, MIT License (MIT).
    (2) "Primer CSS", Copyright (c) 2016 GitHub Inc., MIT License (MIT).
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.

# Credits

This template is build on top of [Sindre Sorhus](https://github.com/sindresorhus)’ **GitHub Markdown CSS**, plus some CSS modules taken from [GitHub](https://github.com) Incorporation’s **Primer CSS**:

  - [GitHub Markdown CSS](https://sindresorhus.com/github-markdown-css)
  - [Primer-CSS](http://primercss.io/)

## GitHub Markdown CSS

**GitHub Markdown CSS** is Copyright © Sindre Sorhus, released under [The MIT License](https://github.com/sindresorhus/github-markdown-css/blob/gh-pages/readme.md) (MIT).

These template files are derivatives from **GitHub Markdown CSS**:

  - [`src/_github-markdown.scss`](./src/_github-markdown.scss) (adapted from [`github-markdown.css`](https://github.com/sindresorhus/github-markdown-css/blob/gh-pages/github-markdown.css))

## Primer CSS

**Primer CSS** is Copyright © 2016 GitHub Inc., released under [The MIT License](https://github.com/primer/primer-css/blob/master/LICENSE) (MIT).

These template files are derivatives from the **Primer CSS** project’s modules:

  - [`src/_github-markdown.scss`](./src/_github-markdown.scss) (borrows snippets from various Primer modules)
  - [`src/_alerts.scss`](./src/_alerts.scss) (adapted from [`flash.scss`](https://github.com/primer/primer/blob/master/modules/primer-alerts/lib/flash.scss))

# Changelog

  - **v2.1** (2018-02-28)
      - New `$charset$` template var to (optionally) override document enconding.
  - **v2.0** (2017-11-21)
      - Pandoc v2.x adaptation.
      - New system for building template from source files.
      - Stylesheet cleanup and improvements, now built from Sass SCSS source files.
  - **v1.1** (2017-04-10)
      - Added new custom Alert class “`flash-plain`” with greyish colors. (pp-macro: `!GFMAlertPlain()`).
  - **v1.0** (2017-04-09)
      - First release.
