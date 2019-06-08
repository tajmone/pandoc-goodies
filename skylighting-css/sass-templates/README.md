# Sass Highlighting Templates for Pandoc

    pandoc v2.7.2 | v1.19.2

Sass/SCSS templates for creating custom syntax highlighting themes for pandoc v2.

> __WARNING: The current Sass/CSS files in this folder will not work with pandoc `< v2.0.4`!__ 
> 
> Pandoc v2.0.4 introduced some breaking changes in the way code is syntax highlighted in html documents. (For more info, see [README in parent folder])


-----

**Table of Contents**


<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3,4" -->

- [Resources List](#resources-list)
    - [Pandoc v1 Styles](#pandoc-v1-styles)
- [Introduction](#introduction)
- [System Requirements](#system-requirements)
    - [Installing Dart Sass](#installing-dart-sass)

<!-- /MarkdownTOC -->

-----


# Resources List

- [`bare-bones.scss`](./bare-bones.scss) — Basic Sass/SCSS boilerplate replicating pandoc built-in sytles.
- [`build-n-watch.sh`](./build-n-watch.sh) — Bash script for building and watching SCSS files in this folder.
- [`UNLICENSE`](./UNLICENSE) — The Unlicense terms (pulic domain) for the SCSS files.

## Pandoc v1 Styles

- [`/pandoc_v1/`](./pandoc_v1/)

In the "[`/pandoc_v1/`](./pandoc_v1/)" folder you'll find the equivalent files for pandoc v1 — version 2 introduced some changes in syntax highlighting HTML tags and built-in CSS styles, so the old files are kept for projects that still require pandoc `v1.x`.

From [pandoc v2.0 release notes]:

> The way highlighted code blocks are formatted in HTML has been changed (David Baynard), in ways that may require changes in hard-coded CSS affecting highlighting. (If you haven't included hard-coded highlighting CSS in your template, you needn't change anything.)

Most notably, line-numbered code dosen't use HTML tables anymore.

# Introduction

Sass (syntactically awesome stylesheets) is a great tool for creating CSS stylesheets:

- http://sass-lang.com

Especially so if you're planning to create a stylesheet that applies different color themes for each language — then Sass will save you time and let you work with smaller and less entangled source files.

Here you'll find some ready-made SCSS templates and modules to style pandoc syntax highlighting.

# System Requirements

Since June, 2019 this project has switched from using [Ruby Sass] to the newest [Dart Sass] because Ruby Sass reached its end-of-life in March 26, 2019, and is no longer maintained.

Since Dart Sass behavior is slightly different from Ruby Sass, anyone working on the repository Sass sources must ensure to switch to Dart Sass to avoid creating divergent CSS stylesheets.

## Installing Dart Sass

The easiest way to install Dart Sass on Windows, and keep it always updated, is to install it via Chocolatey:

- https://chocolatey.org/packages/sass

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS                                
------------------------------------------------------------------------------>

[README in parent folder]: ../README.md#breaking-changes "Go to parent folder's README file"
[pandoc v2.0 release notes]: https://github.com/jgm/pandoc/releases/tag/2.0 "View pandoc 2.0 release notes"

<!-- dependencies -->

[Sass]: https://sass-lang.com "Visit Sass website"
[Ruby Sass]: https://github.com/sass/ruby-sass
[Dart Sass]: https://github.com/sass/dart-sass
[Choco Sass]: https://chocolatey.org/packages/sass

<!-- EOF -->
