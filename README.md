# Kielipankki Course Material Template

This template is used when converting non-slide content (front page, tutorials,
handouts...) to HTML for publishing.

Original project
[tajmone/pandoc-goodies](https://github.com/tajmone/pandoc-goodies) by Tristano
Ajmone. See [template license](templates/html5/github/LICENSE) for all
contributors to the actual HTML template.

Original author guaranteed compatibility with pandoc v2.7.2, but this has been
successfully used with version 2.9.2.1 (the newest available from Ubuntu
default apt repositories at the time of writing).

-----

**Table of Contents**


<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2" -->

- [Available Goodies](#available-goodies)
    - [Pandoc HTML5 Templates](#pandoc-html5-templates)
    - [PP Macros](#pp-macros)
    - [Skylighting Assets](#skylighting-assets)
- [Related Projects](#related-projects)
- [Third Party Code Credits](#third-party-code-credits)
- [Notes About Pandoc License](#notes-about-pandoc-license)
    - [GPLv2 vs BSD-3](#gplv2-vs-bsd-3)

<!-- /MarkdownTOC -->

-----

# Available Goodies

## Pandoc HTML5 Templates

- [`/templates/html5/`](./templates/html5/)

Currently, there's only one template available:

- [GitHub Pandoc HTML5 Template](./templates/html5/github/)
- HTML Preview: [Local](./templates/html5/github/GitHub-Template-Preview.html) | [via HTMLPreview.GitHub.io](http://htmlpreview.github.io/?https://github.com/tajmone/pandoc-goodies/blob/master/templates/html5/github/GitHub-Template-Preview.html)

## PP Macros

- [`/pp/`](./pp/) — The PP-Macros Library

The pp-macros section is an ongoing effort to create a collection of pp macros to extend pandoc's markdown workflow by providing means to use GFM task lists in markdown source file, external syntax highlighters, and many more features.


> **About PP**: PP is a text preprocessor designed for Pandoc (and more generally Markdown and reStructuredText). It's cross-platform and available as a single standalone binary file:
>
> - https://github.com/CDSoft/pp
> - http://cdsoft.fr/pp/
> - https://github.com/tajmone/markdown-guide/tree/master/pp

## Skylighting Assets

- [`/skylighting/`](./skylighting/)

This directory tree gathers various assets for [Skylighting], the syntax highlighter used by pandoc — currently only themes and stylesheets, but in the future it might host also additional syntax definitions.

### Skylighting CSS

- [`/skylighting/css/`](./skylighting/css/)

The skylighting CSS section contains resources for styling code blocks in HTML format — via CSS and Sass.


### Skylighting Themes

- [`/skylighting/themes/`](./skylighting/themes/)

The skylighting themes section contains resources for customizing syntax highlighting styles via KDE theme files (JSON).



# Related Projects

Here is a list of other pandoc-related projects which you might be interested in visiting:

- [GitHub Pages Themes Magick] — Create a repo's GitHub Pages website from its `README.md` file via pandoc and pandoc templates (now supports pandoc v2).

# Third Party Code Credits

The "Pandoc-Goodies" project reuses third party source code from the following projects:

- [GitHub Markdown CSS](https://github.com/sindresorhus/github-markdown-css) — © Sindre Sorhus, MIT License.
- [Primer CSS](https://github.com/primer/primer-css) — © 2016 GitHub Inc., MIT License.

You'll find more details and license information in the documentation of the subfolders.

# Notes About Pandoc License

Some legal stuff you should be aware regarding the license terms governing pandoc and some of its built-in resources.

Pandoc is (c) 2006-2017 John MacFarlane, released under the **GPL v2** (or greater) license.

The built-in styles (aka syntax themes) that pandoc injects into the final documents also fall under the same **GPL v2** license as pandoc.

Pandoc's built-in default templates are dual-licensed — under both the **GPL** (**v2** or higher, same as pandoc) and the **BSD 3-clause** ("New" or "Revised") license:

- https://github.com/jgm/pandoc-templates

You should be aware that the built-in syntax highlighting styles are not part of the templates, and therefore are not subject to dual-licensing. Styles are added at conversion time (for those format that support highlighting). Since pandoc's default templates rely on the built-in styles, syntax highlighting might (depending on output format) automatically include into the final document a built-in style ("pygments", by default). Since highligthing-styles are governed by the **GPL v2** license (which demands same licensing), opting for the **BSD 3-clause** license might no longer apply to the final document if the template and the styling are woven together into a single file.

For a more detailed explanation regarding HTML templates and CSS styles, see:

- [/skylighting/css/built-in-styles/README.md](./skylighting/css/built-in-styles/README.md#license)

## GPLv2 vs BSD-3

A quick reference summary of both **GPL v2** and **BSD 3-clause** licenses — Text excerpts and tables taken from [choosealicense.com](https://choosealicense.com/) (license: [CC BY 3.0](https://creativecommons.org/licenses/by/3.0/)):

- https://choosealicense.com/licenses/gpl-2.0/
- https://choosealicense.com/licenses/bsd-3-clause/

### GNU General Public License v2.0

The GNU GPL is the most widely used free software license and has a strong copyleft requirement. When distributing derived works, the source code of the work must be made available under the same license. There are multiple variants of the GNU GPL, each with different requirements.

|       Permissions       |               Conditions              |    Limitations     |
|-------------------------|---------------------------------------|--------------------|
| &#x2714; Commercial use | &#x2714; Disclose source              | &#x2718; Liability |
| &#x2714; Distribution   | &#x2714; License and copyright notice | &#x2718; Warranty  |
| &#x2714; Modification   | &#x2714; Same license                 |                    |
| &#x2714; Private use    | &#x2714; State changes                |                    |

### BSD 3-clause "New" or "Revised" License

A permissive license similar to the [BSD 2-Clause License](https://choosealicense.com/licenses/bsd-2-clause/), but with a 3rd clause that prohibits others from using the name of the project or its contributors to promote derived products without written consent.

|       Permissions       |               Conditions              |    Limitations     |
|-------------------------|---------------------------------------|--------------------|
| &#x2714; Commercial use | &#x2714; License and copyright notice | &#x2718; Liability |
| &#x2714; Distribution   |                                       | &#x2718; Warranty  |
| &#x2714; Modification   |                                       |                    |
| &#x2714; Private use    |                                       |                    |


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[Skylighting]: https://github.com/jgm/skylighting "Visit Skylighting repository on GitHub"
[GitHub Pages Themes Magick]: https://tajmone.github.io/gh-themes-magick/ "Visit GitHub Pages Themes Magick website"
[gh-themes-magick]: https://tajmone.github.io/gh-themes-magick/ "Visit GitHub Pages Themes Magick repository on GitHub"

<!-- EOF -->
