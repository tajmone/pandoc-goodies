# Contributing to Pandoc Goodies

Contributions are most welcome. The aim of the Pandoc Goodies project is gather a collection of useful resources for working with pandoc, therefore feel free to submit assets you've created for you personal workflow, so that others might benefit from them.

Even if what you'd like to contribute doesn't quite fit the current project's structure, it doesn't mean that the project can't accomodate it.

For any questions, proposals, and even to just provide links to third party assets you think should be included in Pandoc Goodies, feel free to open an issue:

- [open new issue](https://github.com/tajmone/pandoc-goodies/issues/new)

# Auto-Generated TOCs

Table of Contents in markdown documents are handled via the [MarkdownTOC] package for [Sublime Text]. You'll notice in the mardkown sources the presence of these tags within HTML comments:

```html
<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3,4" -->
...
<!-- /MarkdownTOC -->
```

Please don't remove them for they are needed for auto-updating the TOC at save time. Also, don't bother to manually update the TOC contents if you don't have Sublime Text and MarkdownTOC — I'll just updated it when merging-in the pull request.

# TODO Lists

If you'd like to see what new features are currently queued in our wishlist, check the `TODO` files scattered around the repo.

- [`pp/TODO.md`](./pp/TODO.md) — whishlist and queued jobs for pp-macros.
- [`templates/html5/github/TODO.md`](./templates/html5/github/TODO.md) — planned changes for GH Template.


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS                                
------------------------------------------------------------------------------>

[MarkdownTOC]: https://packagecontrol.io/packages/MarkdownTOC "Go to MarkdownTOC page at Package Control"
[Sublime Text]: https://www.sublimetext.com/ "Visit Sublime Text website"

<!-- EOF -->
