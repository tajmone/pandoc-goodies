# Skylighting CSS

    pandoc v2.0.2 | v1.19.2

A collection of CSS/SCSS resources for styling code blocks syntax-highlighted by pandoc (HTML documents).

-----

**Table of Contents**

<!-- #toc -->

  - [Resources List](#resources-list)
  - [Introduction](#introduction)
  - [Appendixes](#appendixes)
      - [Pandoc’s Syntax-Highlighting Engine](#pandocs-syntax-highlighting-engine)
      - [Pandoc’s Supported Languages](#pandocs-supported-languages)

<!-- /toc -->

-----

# Resources List

  - [`/built-in-styles/`](./built-in-styles/) — Standalone CSS files of pandoc’s eight built-in highlighting styles.
  - [`/sass-templates/`](./sass-templates/) — Sass templates for creating custom highlighting themes.

# Introduction

Pandoc features a [built-in syntax highlighter](#pandocs-syntax-highlighting-engine) with over 120 languages definitions ([full list](#pandocs-supported-languages)), and eight ready-to-use highlighting styles to choose from.

Highlighted code blocks can optionally have line numbers, and it’s also possible to specify the starting line number.

As of pandoc v2, it’s now possible to load dynamically custom syntax definitions and styles for highlighting, via the new `--syntax-definition=FILE` and `--highlight-style=STYLE|FILE` options.

# Appendixes

## Pandoc’s Syntax-Highlighting Engine

  - <https://github.com/jgm/skylighting>

Since [version 1.19.2](https://github.com/jgm/pandoc/releases/tag/1.19.2) (Jan 2017) pandoc switched its internal highlighting engine from [highlighting-kate](https://github.com/jgm/highlighting-kate) to [skylighting](https://github.com/jgm/skylighting).

## Pandoc’s Supported Languages

As of Pandoc 2.0.2, the number of supported languages/syntaxes is 123.

|              |            |                |                 |                  |
| ------------ | ---------- | -------------- | --------------- | ---------------- |
| ABC          | ASN.1      | ASP            | ATS             | AWK              |
| ActionScript | Ada        | Agda           | alertindent     | Apache           |
| Bash         | BibTeX     | Boo            | C               | cs               |
| C++          | CMake      | CSS            | changelog       | Clojure          |
| Coffee       | ColdFusion | Common Lisp    | Curry           | D                |
| dtd          | diff       | DjangoTemplate | dockerfile      | Doxygen          |
| doxygenlua   | eiffel     | elixir         | email           | Erlang           |
| fsharp       | Fortran    | GCC            | GLSL            | GNU Assembler    |
| m4           | Go         | HTML           | Hamlet          | haskell          |
| Haxe         | ini        | isoCpp         | Idris           | FASM             |
| Nasm         | JSON       | JSP            | Java            | JavaScript       |
| Javadoc      | Julia      | kotlin         | LLVM            | LaTeX            |
| Lex          | LilyPond   | literateCurry  | literateHaskell | Lua              |
| mips         | makefile   | markdown       | mathematica     | MATLAB           |
| Maxima       | MediaWiki  | metafont       | modelines       | Modula-2         |
| Modula-3     | Mono-Basic | OCaml          | Objective-C     | Objective C++    |
| Octave       | OpenCL     | PHP            | Pascal          | Perl             |
| Pike         | postscript | PowerShell     | prolog          | Pure             |
| PureBASIC    | Python     | R              | RELAX NG        | RELAX NG Compact |
| roff         | Ruby       | RHTML          | Rust            | SGML             |
| SQL          | sqlmysql   | sqlpostgresql  | Scala           | Scheme           |
| tcl          | tcsh       | texinfo        | mandoc          | vhdl             |
| verilog      | XML        | xul            | YAML            | Yacc             |
| zsh          | dot        | noweb          | rest            | sci              |
| sed          | xorg       | xslt           |                 |                  |
