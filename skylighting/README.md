# Skylighting Assets

This directory tree gathers various assets for [Skylighting], the syntax highlighter used by pandoc — currently only themes and stylesheets, but in the future it might host also additional syntax definitions.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Assets Lists](#assets-lists)
- [Pandoc Highlighting Engine](#pandoc-highlighting-engine)
    - [About Skilighting](#about-skilighting)
    - [Supported Syntaxes](#supported-syntaxes)

<!-- /MarkdownTOC -->

-----

# Assets Lists

- [`/css/`](./css/) — Sass & CSS resources for customizing HTML themes.
- [`/themes/`](./themes/) — resources for KDE themes (JSON).
- [`Tokens-Guide.md`](./Tokens-Guide.md) — description of skylighting tokens, form KDE/Kate documentation.
- [`Tokens-CSS.md`](./Tokens-CSS.md) — lookup tables for theme tokens to CSS classes equivalences.

# Pandoc Highlighting Engine

Pandoc features a [built-in syntax highlighter] with over 120 syntaxes definitions ([see full list]), and eight ready-to-use highlighting styles to choose from.

Highlighted code blocks can optionally have line numbers, and it's also possible to specify the starting line number.

As of pandoc v2, it's now possible to load dynamically custom syntax definitions and styles for highlighting, via the new `--syntax-definition=FILE` and `--highlight-style=STYLE|FILE` options.


## About Skilighting

- https://github.com/jgm/skylighting

Since [version 1.19.2]  (Jan 2017) pandoc switched its internal highlighting engine from [highlighting-kate] to [skylighting].

## Supported Syntaxes

As of [v2.7.2], pandoc supports highlighting for 129 languages/syntaxes. You can query pandoc for the full list via:

    pandoc --list-highlight-languages

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
[Skylighting]: https://github.com/jgm/skylighting "Visit Skylighting repository on GitHub"

<!-- pandoc releases -->

[version 1.19.2]: https://github.com/jgm/pandoc/releases/tag/1.19.2 "View pandoc 1.19.2 release notes"
[v2.7.2]: https://github.com/jgm/pandoc/releases/tag/2.7.2 "View pandoc 2.7.2 release notes"

<!-- xrefs -->

[built-in syntax highlighter]: #about-skilighting "jump to section"
[see full list]: #supported-syntaxes "jump to section"

<!-- EOF -->
