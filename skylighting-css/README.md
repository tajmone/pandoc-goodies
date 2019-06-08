# Skylighting CSS

    pandoc v2.7.2 | v1.19.2

A collection of CSS/SCSS resources for styling code blocks syntax-highlighted by pandoc (HTML documents).


-----

**Table of Contents**


<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3,4" -->

- [Resources List](#resources-list)
- [Introduction](#introduction)
- [Breaking Changes](#breaking-changes)
    - [Pandoc v2.0.4](#pandoc-v204)
- [Appendixes](#appendixes)
    - [Pandoc's Syntax-Highlighting Engine](#pandocs-syntax-highlighting-engine)
    - [Pandoc Highlighting Supported Languages](#pandoc-highlighting-supported-languages)

<!-- /MarkdownTOC -->

-----


# Resources List

  - [`/built-in-styles/`](./built-in-styles/) — Standalone CSS files of pandoc's eight built-in highlighting styles.
  - [`/sass-templates/`](./sass-templates/) — Sass templates for creating custom highlighting themes.


# Introduction

Pandoc features a [built-in syntax highlighter] with over 120 languages definitions ([full list]), and eight ready-to-use highlighting styles to choose from.

Highlighted code blocks can optionally have line numbers, and it's also possible to specify the starting line number.

As of pandoc v2, it's now possible to load dynamically custom syntax definitions and styles for highlighting, via the new `--syntax-definition=FILE` and `--highlight-style=STYLE|FILE` options.

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


# Appendixes

## Pandoc's Syntax-Highlighting Engine

- https://github.com/jgm/skylighting

Since [version 1.19.2]  (Jan 2017) pandoc switched its internal highlighting engine from [highlighting-kate] to [skylighting].


## Pandoc Highlighting Supported Languages

As of [v2.7.2], pandoc supports highlighting for 129 languages/syntaxes.

|                 |              |               |                |               |
|-----------------|--------------|---------------|----------------|---------------|
| abc             | asn1         | asp           | ats            | awk           |
| actionscript    | ada          | agda          | alertindent    | apache        |
| bash            | bibtex       | boo           | c              | cs            |
| cpp             | cmake        | css           | changelog      | clojure       |
| coffee          | coldfusion   | commonlisp    | curry          | d             |
| dtd             | default      | diff          | djangotemplate | dockerfile    |
| doxygen         | doxygenlua   | eiffel        | elixir         | email         |
| erlang          | fsharp       | fortran       | gcc            | glsl          |
| gnuassembler    | m4           | go            | html           | hamlet        |
| haskell         | haxe         | ini           | isocpp         | idris         |
| fasm            | nasm         | j             | json           | jsp           |
| java            | javascript   | javadoc       | julia          | kotlin        |
| llvm            | latex        | lex           | lilypond       | literatecurry |
| literatehaskell | lua          | mips          | makefile       | markdown      |
| mathematica     | matlab       | maxima        | mediawiki      | metafont      |
| modelines       | modula2      | modula3       | monobasic      | ocaml         |
| objectivec      | objectivecpp | octave        | opencl         | php           |
| povray          | pascal       | perl          | pike           | postscript    |
| powershell      | prolog       | protobuf      | pure           | purebasic     |
| python          | r            | relaxng       | relaxngcompact | roff          |
| ruby            | rhtml        | rust          | sgml           | sml           |
| sql             | sqlmysql     | sqlpostgresql | scala          | scheme        |
| tcl             | tcsh         | texinfo       | mandoc         | typescript    |
| vhdl            | verilog      | xml           | xul            | yaml          |
| yacc            | zsh          | dot           | noweb          | rest          |
| sci             | sed          | xorg          | xslt           |               |


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
