# Sass Highlighting Templates for Pandoc

    pandoc v2.0.5 | v1.19.2

Sass templates for creating custom syntax highlighting themes for pandoc v2.

> __WARNING: The current Sass/CSS files in this folder will not work with pandoc `< v2.0.4`!__ 
> 
> Pandoc v2.0.4 introduced some breaking changes in the way code is syntax highlighted in html documents. (For more info, see [parent folder's `README`][parent README])

[parent README]: ../README.md#breaking-changes "Go to parent folder's README file"

-----

**Table of Contents**

<!-- #toc -->

  - [Resources List](#resources-list)
      - [Pandoc v1 Styles](#pandoc-v1-styles)
  - [Introduction](#introduction)

<!-- /toc -->

-----

# Resources List

  - [`bare-bones.scss`](./bare-bones.scss) — Basic Sass boilerplate replicating pandoc’s built-in sytles.
  - [`build-n-watch.bat`](./build-n-watch.bat) — Batch script for building and watching SCSS files in this folder.
  - [`UNLICENSE`](./UNLICENSE) — The Unlicense terms (pulic domain) for the SCSS files.

## Pandoc v1 Styles

  - [`/pandoc_v1/`](./pandoc_v1/)

In the “[`/pandoc_v1/`](./pandoc_v1/)” you’ll’ find the equivalent files for pandoc v1 — version 2 introduced some changes in syntax highlighting HTML tags and built-in styles’ CSS, so the old files are kept for projects that still require pandoc `v1.x`.

From [pandoc v2.0 release notes](https://github.com/jgm/pandoc/releases/tag/2.0):

> The way highlighted code blocks are formatted in HTML has been changed (David Baynard), in ways that may require changes in hard-coded CSS affecting highlighting. (If you haven’t included hard-coded highlighting CSS in your template, you needn’t change anything.)

Most notably, line-numbered code dosen’t use HTML tables anymore.

# Introduction

Sass (syntactically awesome stylesheets) is a great tool for creating CSS stylesheets:

  - <http://sass-lang.com/>

Especially so if you’re planning to create a stylesheet that applies different color themes for each language — then Sass will save you time and let you work with smaller and less entangled source files.

Here you’ll find some ready-made SCSS templates and modules to style pandoc syntax highlighting.
