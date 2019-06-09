# Skylighting JSON Themes

    pandoc v2.7.2

Resources for customizing syntax highlighting styles via KDE theme files.

-----

**Table of Contents**


<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3,4" -->

- [Files List](#files-list)
- [Introduction](#introduction)
- [KDE vs Pandoc Themes](#kde-vs-pandoc-themes)
    - [KDE Themes Data Excess](#kde-themes-data-excess)
- [Theme Boilerplate](#theme-boilerplate)
    - [Usage Guidelines](#usage-guidelines)
        - [The "Normal" Style](#the-normal-style)
        - [The Metadata](#the-metadata)
        - [Base Colors and Line Numbers](#base-colors-and-line-numbers)
        - [Text Styles/Token Types](#text-stylestoken-types)
- [References](#references)

<!-- /MarkdownTOC -->

-----

# Files List

- [`boilerplate.theme`][boilerplate] — Highlight-style boilerplate (public domain).
- [`update.sh`][update] — script to autogenerate/update the JSON themes.
- [`UNLICENSE`][UNLICENSE] — Public domain declaration for `boilerplate.theme`

pandoc built-in KDE themes (JSON files):

- [`builtin-breezedark.theme`][breezedark]
- [`builtin-espresso.theme`][espresso]
- [`builtin-haddock.theme`][haddock]
- [`builtin-kate.theme`][kate]
- [`builtin-monochrome.theme`][monochrome]
- [`builtin-pygments.theme`][pygments] (default theme)
- [`builtin-tango.theme`][tango]
- [`builtin-zenburn.theme`][zenburn]


# Introduction

Pandoc v2 introduced a new feature which allows to dynamically load a custom syntax highlighting theme file (JSON) via the `--highlight-style=FILE` option:

> __`--highlight-style=`*STYLE*|*FILE*__
> 
> Instead of a *STYLE* name, a JSON file with extension `.theme` may be supplied. This will be parsed as a KDE syntax highlighting theme and (if valid) used as the highlighting style. 
>
>  To generate the JSON version of an existing style, use `--print-highlight-style`.


# KDE vs Pandoc Themes

Pandoc uses KDE syntax highlighting themes, but it's worth noting that KDE themes contain more data than what is actually needed for pandoc usage. If you wish to use a KDE theme with pandoc, then the data excess isn't a concern to you. On the other hand, if you'r building a theme from scratch, than you might be better off working with the boilerplate file provided here, which contains only the data required for pandoc usage.

You can find examples of KDE themes at:

- https://github.com/KDE/syntax-highlighting/tree/master/data/themes

If you diff-compare the [pandoc Kate theme] to the [Kate theme on the KDE repository], you'll notice that the pandoc version doesn't contain the KDE JSON keys which are not used by pandoc, and that it also contains additional keys which are pandoc-specific. 


## KDE Themes Data Excess

The problem with KDE syntax highlighting theme files is that they contain many keys which are not actually used by pandoc for highligthing. (See [Issue #4096])

For example, let's look at the [Kate theme on the KDE repository].

Some members of `"text-styles"` have `"selected-text-color"` and `"strike-through"` entries, which don't affect the ouput of pandoc highlighting:

``` json
{ ...
    "text-styles": {
        "Normal" : {
            "text-color" : "#1f1c1b",
            "selected-text-color" : "#ffffff",
            "bold" : false,
            "italic" : false,
            "underline" : false,
            "strike-through" : false
        },
```

Also, most of the name/value pairs in `"editor-colors"` (i.e. 26 out of 28) are specific to the Kate Editor, and will not affect pandoc syntax-highlighting:

``` json
{ ...
    "editor-colors": {
        "background-color" : "#ffffff",
        "code-folding" : "#94caef",
        "bracket-matching" : "#ffff00",
        "current-line" : "#f8f7f6",
        "icon-border" : "#f0f0f0",
        "indentation-line" : "#d2d2d2",
        "line-numbers" : "#a0a0a0",
        "current-line-number" : "#1e1e1e",
        "mark-bookmark" : "#0000ff",
        "mark-breakpoint-active" : "#ff0000",
        "mark-breakpoint-reached" : "#ffff00",
        "mark-breakpoint-disabled" : "#ff00ff",
        "mark-execution" : "#a0a0a4",
        "mark-warning" : "#00ff00",
        "mark-error" : "#ff0000",
        "modified-lines" : "#fdbc4b",
        "replace-highlight" : "#00ff00",
        "saved-lines" : "#2ecc71",
        "search-highlight" : "#ffff00",
        "selection" : "#94caef",
        "separator" : "#898887",
        "spell-checking" : "#bf0303",
        "tab-marker" : "#d2d2d2",
        "template-background" : "#d6d2d0",
        "template-placeholder" : "#baf8ce",
        "template-focused-placeholder" : "#76da98",
        "template-read-only-placeholder" : "#f6e6e6",
        "word-wrap-marker" : "#ededed"
    },
```

# Theme Boilerplate

- [`boilerplate.theme`][boilerplate]

For the above mentioned reasons, I've created a [theme boilerplate] containing only entries that are significant for pandoc usage (the boilerplate is released into the [Public Domain][UNLICENSE]).

This boilerplate is a more manageable template for building a custom theme.

> **NOTE** — I haven't been able to find much documentation on how pandoc/skylighting handle themes; so I've been relying on testing with theme files and on peeking at skylighting sourcecode.

## Usage Guidelines

Here are some guidelined on how to edit custom theme files.

- You can safely delete any unneeded entry (ie: name/value pair).
- You can delete `false`-valued boolean entries (they'll be `false` by default).
- Color values must be hex strings in the "`#00ff00`" format (color names like `"red"` are not allowed, nor are RGB color definitions).
- Using the `null` value will cause the corresponding style to be omitted in the final CSS (eg: `"text-color": null,` will not produce any `color:` property).
- The order of the entries can be changed.
- Beware of the commas! Missing or misplaced commas will cause the theme to fail.

You might even add comments (or any custom entry) via extra string entries, as long as they are valid JSON — they'll be just ignored! Example:

``` json
{
    "Comment": "JUST A COMMENT",
    "text-styles": {
        "Normal": {
            "text-color": "#ffffff",
```

... but you should avoid this in published theme files; it would only add confusion regarding theme's standard. But in case you're using some custom app or scripts to generate pandoc theme files, you should be relieved to know that you can safely add custom entries for that app/script's sake, without breaking a pandoc theme.

### The "Normal" Style

Pandoc doesn't actually use the `Normal` token (there is not corresponding class), so all settings for `"Normal"` style will have no effect. In the final CSS, these will be applied to `code span.` (CSS reformatted, for clarity):

```css
code span. {
   color: #ffffff;
   background-color: #333333;
   font-weight: bold;
   font-style: italic;
   text-decoration: underline;
} /* Normal */
```

... which have no effect on any tokens, since they are not inherited by other spans. (See [Issue #4176], pandoc 2.0.5)

Since "normal" code is represented outside any `<span>`, its basic style in the theme is handled by the definitions outside the `"text-styles"` block. It's therefore safe to assume that the KDE `"Normal"` entry can be omited from custom pandoc themes, so I've removed it from the boilerplate.

### The Metadata

The `"metadata"` section of the theme is entirely optional — if you delete it the theme will still work. But if you're planning to share your theme with others you should consider filling it appropriately.

``` json
{
  "metadata": {
    "name": "theme boilerplate",
    "author": "Tristano Ajmone <tajmone@gmail.com>",
    "license": "Unlicense",
    "revision": 4
  },
```

- `"name"` — Theme's name.
- `"author"` — Your name.
- `"license"` — Theme's license.
- `"revision"` — Theme's revision number (integer)

> **NOTE** — pandoc simply ignores this data, so you have quite some freedom of action here (you could add custom fields); try nevertheless to stick to the KDE standard as much as you can, for the sake of clarity.

### Base Colors and Line Numbers

Following the `"metadata"` section, and before `"text-styles"`, you'll find the basic styles definitions:

``` json
{ ...  
  "text-color": "#888888",
  "background-color": "#666666",
  "line-number-color": "#0000ff",
  "line-number-background-color": "#00ff00",
  
  "text-styles": {
```

These entries are rather self-explaining:

- `"text-color":` — base code foreground color ("normal").
- `"background-color":` — background color for the whole code block.

... these are applied directly to the `<div>` that wraps the whole code block (via `div.sourceCode { … }`).

- `"line-number-color":` — line numbers foreground color.
- `"line-number-background-color":` — background color for line numbers gutter.

... these are applied via `pre.numberSource a.sourceLine::before`. If line numbers background and/or foreground colors are omitted (or set to `null`), the base code block foreground and background colors will be inherited.

The boilerplate default color values for these entries are mere placeholder (and quite hugly ones too); change them according to needs.

### Text Styles/Token Types

All the members of `"text-styles"` represent [skylighting token types], and share some common name/value pairs:

``` json
{ ...
  "text-styles": {
    "Alert": {
      "text-color": "#ffffff",
      "background-color": null,
      "bold": true,
      "italic": true,
      "underline": false
    },
```

... where `"Alert"` correspond to the "Alert" token type, and so on.

I've filled all text-styles with the same sample-data set, which is usually more than you'll ever need. Dummy color values are provided as placeholders. You should edit color values to your needs, and remove any unwanted attributes, including boolean "`false`" values (you can delete the whole entry, for `false` is the defaul value of missing entries).

To temporary disable from the final CSS a specific entry, just set it to `null`. This might be useful during testing, instead of deleting it completely.

The idea is to avoid copy-&-paste operations: everything you might need for any text-style is there, just remove what you don't need. It seemed better to me than having a single entry with the data, and then have to copy and paste it over what was needed.

For example, if you wanted Constants to be shown in red (`#ff0000`) and **bold**, you'd only keep:

``` json
{ ...
        "Constant": {
            "text-color": "#ff0000",
            "bold": true,
        },
```

For a full explanation of the role of each token, see:

- [`../Tokens-Guide.md`](../Tokens-Guide.md)

# References

- https://github.com/jgm/skylighting
- https://github.com/KDE/syntax-highlighting


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS                                
------------------------------------------------------------------------------>

[Kate theme on the KDE repository]: https://github.com/KDE/syntax-highlighting/blob/master/data/themes/default.theme "Link to Kate theme source at KDE repository"
[pandoc Kate theme]: ./builtin-kate.theme "View local copy of the pandoc KDE theme"
[theme boilerplate]: ./boilerplate.theme

<!-- project files -->

[skylighting token types]: ../Tokens-Guide.md "See full description of token types"

<!-- project files -->

[boilerplate]: ./boilerplate.theme
[breezedark]: ./builtin-breezedark.theme
[espresso]: ./builtin-espresso.theme
[haddock]: ./builtin-haddock.theme
[kate]: ./builtin-kate.theme
[monochrome]: ./builtin-monochrome.theme
[pygments]: ./builtin-pygments.theme
[tango]: ./builtin-tango.theme
[UNLICENSE]: ./UNLICENSE
[update]: ./update.sh
[zenburn]: ./builtin-zenburn.theme


<!-- pandoc issues -->

[Issue #4096]: https://github.com/jgm/pandoc/issues/4096 "pandoc Issue #4096: Default Theme is Kate not Pygments"
[Issue #4176]: https://github.com/jgm/pandoc/issues/4176 "pandoc Issue #4176: CSS Styles "Normal" Outputs as Classless Class Selector"


<!-- EOF -->
