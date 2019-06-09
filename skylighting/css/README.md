# Skylighting CSS

    pandoc v2.7.2 | v1.19.2

A collection of CSS/SCSS resources for styling code blocks syntax-highlighted by pandoc (HTML documents).


-----

**Table of Contents**


<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3,4" -->

- [Resources List](#resources-list)
- [Breaking Changes](#breaking-changes)
    - [Pandoc v2.0.4](#pandoc-v204)

<!-- /MarkdownTOC -->

-----


# Resources List

  - [`/built-in-styles/`](./built-in-styles/) — Standalone CSS files of pandoc's eight built-in highlighting styles.
  - [`/sass-templates/`](./sass-templates/) — Sass templates for creating custom highlighting themes.


# Breaking Changes

Beware of some important changes in pandoc v2.x relases regarding the way code is syntax highlighted. Some of these changes will require modification of custom CSS sytlesheets created for previous versions.

## Pandoc v2.0.4 

[Pandoc 2.0.4] introduced some changes in the html tags used for highlighting source code.

Source lines now use `<a>` tag instead of `<div>`:
 
pandoc 2.0–2.0.3:
   
``` html
<div class="sourceLine">
```
pandoc >=2.0.4:
   
``` html
<a class="sourceLine">
```



<!-----------------------------------------------------------------------------
                               REFERENCE LINKS                                
------------------------------------------------------------------------------>

[highlighting-kate]: https://github.com/jgm/highlighting-kate "Visit repository"
[skylighting]: https://github.com/jgm/skylighting "Visit repository"

<!-- pandoc releases -->

[version 1.19.2]: https://github.com/jgm/pandoc/releases/tag/1.19.2 "View pandoc 1.19.2 release notes"
[Pandoc 2.0.4]: https://github.com/jgm/pandoc/releases/tag/2.0.4 "View pandoc 2.0.4 release notes"
[v2.7.2]: https://github.com/jgm/pandoc/releases/tag/2.7.2 "View pandoc 2.7.2 release notes"

<!-- xrefs -->

[built-in syntax highlighter]: #pandocs-syntax-highlighting-engine "jump to section"
[full list]: #pandoc-highlighting-supported-languages "jump to section"

<!-- EOF -->
