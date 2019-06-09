# Skylighting CSS Classes

This document contains lookup tables for the equivalence of [skylighting] token types names to CSS classes, and viceversa.


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Introduction](#introduction)
    - [Token-Types to CSS-Classes](#token-types-to-css-classes)
    - [CSS-Classes to Token-Types](#css-classes-to-token-types)

<!-- /MarkdownTOC -->

-----

# Introduction

The tables below are useful if you're working on Sass/CSS themes for customizing the look and feel of pandoc syntax highlighting. For a full explanation of the role of each token, see:

- [`Tokens-Guide.md`](./Tokens-Guide.md)

The list of skylighting supported token types can be found in the "`Types.hs`" source file:

- https://github.com/jgm/skylighting/blob/master/skylighting-core/src/Skylighting/Types.hs#L186

Their HTML class-names equivalents can be found in the "`HTML.hs`" source file:

- https://github.com/jgm/skylighting/blob/master/skylighting-core/src/Skylighting/Format/HTML.hs#L16

## Token-Types to CSS-Classes

Here is a reference table listing all the token types by name, as they appear in Skylighting `.theme` files (JSON) and their corresponding CSS classes names:

|     TOKEN      | CLASS |
|----------------|-------|
| Normal         | ---   |
| Alert          | `.al` |
| Annotation     | `.an` |
| Attribute      | `.at` |
| BaseN          | `.bn` |
| BuiltIn        | `.bu` |
| Char           | `.ch` |
| Comment        | `.co` |
| CommentVar     | `.cv` |
| Constant       | `.cn` |
| ControlFlow    | `.cf` |
| DataType       | `.dt` |
| DecVal         | `.dv` |
| Documentation  | `.do` |
| Error          | `.er` |
| Extension      | `.ex` |
| Float          | `.fl` |
| Function       | `.fu` |
| Import         | `.im` |
| Information    | `.in` |
| Keyword        | `.kw` |
| Operator       | `.op` |
| Other          | `.ot` |
| Preprocessor   | `.pp` |
| RegionMarker   | `.re` |
| SpecialChar    | `.sc` |
| SpecialString  | `.ss` |
| String         | `.st` |
| Variable       | `.va` |
| VerbatimString | `.vs` |
| Warning        | `.wa` |

## CSS-Classes to Token-Types

Here is the same table as above, but ordered by CSS classes instead.

| CLASS |     TOKEN      |
|-------|----------------|
| ---   | Normal         |
| `.al` | Alert          |
| `.an` | Annotation     |
| `.at` | Attribute      |
| `.bn` | BaseN          |
| `.bu` | BuiltIn        |
| `.cf` | ControlFlow    |
| `.ch` | Char           |
| `.cn` | Constant       |
| `.co` | Comment        |
| `.cv` | CommentVar     |
| `.do` | Documentation  |
| `.dt` | DataType       |
| `.dv` | DecVal         |
| `.er` | Error          |
| `.ex` | Extension      |
| `.fl` | Float          |
| `.fu` | Function       |
| `.im` | Import         |
| `.in` | Information    |
| `.kw` | Keyword        |
| `.op` | Operator       |
| `.ot` | Other          |
| `.pp` | Preprocessor   |
| `.re` | RegionMarker   |
| `.sc` | SpecialChar    |
| `.ss` | SpecialString  |
| `.st` | String         |
| `.va` | Variable       |
| `.vs` | VerbatimString |
| `.wa` | Warning        |


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[Skylighting]: https://github.com/jgm/skylighting "Visit Skylighting repository on GitHub"

<!-- EOF -->