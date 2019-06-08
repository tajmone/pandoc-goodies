!def( TEMPL_VER  )(       v2.1 )
!def( TEMPL_DATE )( 2018-02-28 )
!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"PREVIEW.md" v2.1 | 2018-02-28
Tested with "GitHub HTML5 Pandoc Template" v2.1 | 2018/02/28

This file holds the contents that will go in "../GitHub-Template-Preview.html"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---
title:    GitHub Pandoc HTML5 Template
subtitle: !TEMPL_VER \(!TEMPL_DATE\) MIT License
# author:   Tristano Ajmone
# date:   Nov 21, 2017
lang: en
toc-title: Contents
# ============================= HTML META/HEADER ==============================
# These variables are destined to the meta elements in the html head block.
# Use them when you want to show author, date, etc., only in meta elements, or
# you want different values to be displayed in the document and its metadata.
# If these are not set, their equivalent vars (above) will be used instead.
# -----------------------------------------------------------------------------
pagetitle:   GitHub Pandoc HTML5 Template — Preview
author-meta: Tristano Ajmone (tajmone@gmail.com)
date-meta:   !TEMPL_DATE
# =============================== SUMMARY TEXT ================================
# If defined, the contents of `$summary$` key will be displayed right before TOC.
# -----------------------------------------------------------------------------
summary: |
    This is a preview of “_GitHub Pandoc HTML5 Template_” **!TEMPL_VER**,
    ©  Tristano Ajmone 2017, MIT License (MIT).

    You can download it freely from the "__Pandoc-Goodies__" project:

    - <https://github.com/tajmone/pandoc-goodies>

    :::::::: Warning ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    __DISCLAIMER__ --- This theme _is not_ officialy endorsed by GitHub Inc.: it's just a personal project by the author.
    The presence of the word "GitHub" in the template's name only indicates that it mimicks the look and feel of how documents are previewed on [GitHub.com], and _does not_ imply any type of endorsement by, or affiliation to GitHub Inc. or any of its products --- it's "GitHub" as in "GitHubbish", or GitHub-style.

    GITHUB® in an exclusive trademark registered in the United States by [GitHub, Inc.] 
    :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

    [GitHub.com]: https://github.com/ "Visit GitHub.com"
    [GitHub, Inc.]: https://github.com/about "About GitHub, Inc."
...


# Features

This is a fully stand-alone pandoc HTML5 template (embedded CSS stylesheet).
It's ideal for creating single-file documentation for projects, even on [GitHub Pages].

The template mimicks the look and feel of [GitHub](https://github.com/) documents previews --- no 100% accuracy, just the GitHubbish feel. GitHub's styling has changed over the course of time; this template picks and chooses from older and newer versions of GitHub's styles and color schemes, according to the author preferences.

__CSS Styling__ --- This template supports styling for:

- all standard markdown elements
- [pandoc-flavoured markdown][Pandoc Markdown]
- [GitHub flavored markdown elements][GFM Features] 
- some of [GitHub's Primer-CSS advanced styles][GitHub's Primer-CSS Features]
- PP Macros from the "__[Pandoc-Goodies PP-Macros Library]__" project

__Template Variables__ --- This template supports all the standard pandoc template variables, plus some [custom variables][Template Variables] for additional features (eg: `introduction` to show some text before the TOC, and `$toc-title$`). 

## Requirements

Minimum pandoc version required: v2.0

The template was originally adapted from the default html5 template that shipped with <mark>__pandoc v1.19.2.1__</mark> and then adapted to work with <mark>__pandoc v2.0.2__</mark> (introducing backward-compatibility breaking changes).

# Standard Typography

Lorem markdownum stagna *de spatiantes* mirabatur **arboribus at nunc**, somnus sanguine quosque ~~genusque addenda socia~~.[^1] <mark>Plus ipsisque latent</mark>, genus, medio aut rima haberet.

Quem palluerat, vulgaris pignora: <kbd>Crtl</kbd>+<kbd>Z</kbd>.[^2]

<h1>H1 Heading</h1>
<h2>H2 Heading</h2>
<h3>H3 Heading</h3>
<h4>H4 Heading</h4>
<h5>H5 Heading</h5>
<h6>H6 Heading</h6>

> Et vult Ulixe nec mater moras veluti spatio omnia sub quemque ripas ubi. Nil non, sub nec, ubi ferant deus pacis Turni, parentum.
>
> > Ut nobis Ampycides esset indigenae eiecit domini successibus Aiaci tecta nunc terris, Argolica videres est neque. Aeacides caloris, magna canes.[^3]

[^1]: Nec opus caecoque frondibus fervet.
[^2]: Hora sequantur *nimium exiguis et* in fit coniuge aures, adfuit.
[^3]: Turni, parentum. Ut nobis Ampycides esset indigenae eiecit domini successibus Aiaci tecta nunc terris, Argolica videres est neque. Aeacides caloris, magna canes.

## Lists

### Ordered Lists

1. Nec et tormenta tacitae decet aethere
2. Nullamque corpus
    1. Sic nunc naides dubiis
    2. Virgo forti ardent
    3. Dic pro captantur exitus quo viris infera
3. Adit Symplegadas inque

### Bullet Lists

- Dic pro captantur exitus quo viris infera
- Humanam tenderet
    - Est esset devoveas
    - Adit Symplegadas inque
- Lelex ad ira
- Inpositus cum genus extulit nec inseris ille

### Task Lists

- [x] Nec et tormenta tacitae decet aethere
- [ ] Nullamque corpus
    + [x] Sic nunc naides dubiis
    + [ ] Virgo forti ardent

## Definition lists

Term 1

: Definition 1

Term 2 with <mark>inline markup</mark>

: Definition 2

    Hora sequantur *nimium exiguis et* in fit coniuge aures, adfuit.

    Ut sentesflumen, mea ira, et ubi manus silicem.



## Tables

| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell     | _Cell_   | __Cell__ |
| `Cell`   | Cell     | Cell     |
| Cell     | Cell     | Cell     |


## Source Code Blocks


``` python
#!/usr/bin/env python
"""
Print the Fibonacci Sequence to output.
By Alex E. Rodriguez; public domain:
https://github.com/arodriguez23434/arodriguez_2016_fibonacci
"""
def fibo(int):
    #Indices 0 & 1 are pre-set; Addition begins at index 2
    fibo_list = [0,1];
    for i in range(2,int):
        #Add previous sum to previous largest integer: (a+b)=sum -> (b+sum)=new_sum -> ... then append to list
        fibo_list.append(fibo_list[i-2]+fibo_list[i-1]);
    return fibo_list;

print(fibo(100)); #Print list 
```

::::::::: Alert :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
**HIGHLIGHT-STYLE** --- Source code is highlighted using either pandoc's default style (`pygments`) or the style set at invocation by the `--highlight-style=STYLE|FILE` option.
This document uses the `haddock` built-in style.

The template's embedded CSS doesn't define the syntax coloring style, leaving you the freedom to use your own style definition files or pandoc's built-in styles.
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Pandoc Markdown

## Line Blocks

| The limerick packs laughs anatomical
| In space that is quite economical.
|    But the good ones I've seen
|    So seldom are clean
| And the clean ones so seldom are comical

\

::::::: Note ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
__NOTE__ --- Pandoc v2.x no longer adds inline CSS to Line blocks, it assigns them the "`line-block`" class instead, leaving it up to the end-user to define it in the CSS stylesheet. This templates covers Line blocks style definitions.
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# GFM Features

## Inline text elements

You can use the `<mark>` tag to <mark>highlight text</mark>.

~~This line of text is meant to be treated as deleted text.~~

!def(kbdEx)(!kbd(Ctrl)(Alt)(Canc))

Keystroke can be rendered with `<key>` tag: <kbd>Shift</kbd>+<kbd>U</kbd>; or by using the `!raw(!kbd)` PP macro from the [Inline Formatting macros set], eg: `!rawdef(kbdEx)` to output !kbdEx.


# GitHub's Primer-CSS Features

## Alerts

Alerts (aka _flash messages_) are borrowed/inspired from __Primer CSS__, the library that handles all the styling of GitHub's portal:

-   <http://primercss.io/archive/alerts/>

!def(alertGen)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:::::: !1
**!1** --- I'm the "!1" alert!
::::::::::::::::::::::
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!alertGen[Alert]
!alertGen[Warning]
!alertGen[Error]
!alertGen[Success]
!alertGen[Note]



### Creating Alerts Via Fenced-Divs 

This templates emulates Primer's Alerts via custom `<div>` classes (case-sensitive):

- `.Alert` (blue)
- `.Warning` (yellow)
- `.Error` (red)
- `.Success` (green)
- `.Note` (grey)

You can use the above class-names with pandoc's new [fenced-divs] syntax to display alerts in your documents:

!def(alertEx)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::::: Warning :::::::::::::::::::::::::::::::::::::::::
**BEWARE** --- The grey `.Note` alert is a our own
addition, it's not part of Primer-CSS' original Alerts!
:::::::::::::::::::::::::::::::::::::::::::::::::::::::
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

```
!alertEx
```

... result:

!alertEx



### Creating Alerts Via PP Macros

Alternatively, you can create alerts using the PP macros from the [GitHub Alerts macros set]:

!raw
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-   `!GFMAlert( CONTENTS )` — **Alert** (blue)
-   `!GFMError( CONTENTS )` — **Warning** (red)
-   `!GFMWarn( CONTENTS )` — **Error** (yellow)
-   `!GFMSuccess( CONTENTS )` — **Success** (green)
-   `!GFMAlertNote( CONTENTS )` — **Note** (grey)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Example:

!def(alertExPP)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!GFMAlert
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**ALERT** --- I'm an alert created using a PP macro from the
"GitHub Alerts" macros set.

I can contain __markdown__ formatting and <mark>my contents
may span over multiple paragraphs</mark>.

Any kind of markdown element and block may be placed inside
`GFMAlert` macros:

- Apples
- Bananas
- Oranges
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


```
!rawdef(alertExPP)
```

... result:

!alertExPP


These are the different type of alerts available, along with the custom pp-macros used generate them:

!GFMAlert
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Alert** --- Created with the `!raw(!GFMAlert())` PP macro.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!GFMWarn
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Warning** --- Created with the `!raw(!GFMWarn())` PP macro.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!GFMError
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Error** --- Created with the `!raw(!GFMError())` PP macro.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!GFMSuccess
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Success** --- Created with the `!raw(!GFMSuccess())` PP macro.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!GFMAlertNote
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Note** --- Created with the `!raw(!GFMAlertNote())` PP macro.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Template Variables

Beside supporting all the standard pandoc template variables (pandoc v2.0.2), some extra variables were added to the template to allow finer customization.

+---------------+--------------------------------------------------------------------+------------+
|    VAR NAME   |                            DESCRIPTION                             |  DEFAULT   |
+===============+====================================================================+============+
| `$summary$`   | A block of text that will be displayed right before the TOC.<br /> | empty      |
|               | Wrapped in `<div class="summary">`.                                |            |
+---------------+--------------------------------------------------------------------+------------+
| `$toc-title$` | Title for Table of Contents.                                       | `Contents` |
+---------------+--------------------------------------------------------------------+------------+
| `$charset$`   | Override document encoding.                                        | `utf-8`    |
+---------------+--------------------------------------------------------------------+------------+

## The `$summary$` Variable

The `$summary$` text belongs to the `<header>` block, so it won't be displayed unless _title_ was definied. It will be placed after _authors_ and _date_, and right before _Table of Contentes_. It will parsed as markdown, so it offers an easy way to add introductiory text directly in the document's YAML header.

You can see an example of the `$summary$` var at work right in this page.

## The `$charset$` Variable

I've added the `$charset$` variable because I was having trouble using the template inside the WebBrowser Control in a Windows application I created (a markdown file previewer that uses pandoc and this template to quickly render an html preview via WebBrowser Control). The programming language I used would only allow injecting HTML into the WebBrowser Control as UCS-2 enconded Unicode strings, even if pandoc's output was captured as UTF-8 --- ie., while I/O operations allow using different encondings, all internal string operations are restricted to UCS-2.

The problem was fixed by setting `$charset$` to `windows-1251` when invoking pandoc from my Windows application (command line option `-V charset=windows-1251`), as the actual document presented to the WebBrowser Control would no longer be in UTF-8 but in UCS-2 due to internal conversion.

Therefore I thought that there might be other scenarios which might require overriding the default charset encoding of the template because of encoding conversions occuring in a toolchain, protocol transmissions, or whatever. Even though UTF-8 is now the standard enconding for most source and output files when it comes to markdown and HTML, having this optional template variable allows handling edge cases.


!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                         REFERENCE LINKS DEFINITIONS                          
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[GitHub Pages]: https://pages.github.com/ "More info on GitHub Pages"

[Pandoc-Goodies PP-Macros Library]: https://github.com/tajmone/pandoc-goodies/tree/master/pp "Go to the Pandoc-Goodies PP-Macros Library"

[Inline Formatting macros set]: https://github.com/tajmone/pandoc-goodies/tree/master/pp#inline-formatting "More info about the Inline Formatting macros set"

[GitHub Alerts macros set]: https://github.com/tajmone/pandoc-goodies/tree/master/pp#github-alerts "More info about the Alerts macros set"

[fenced-divs]: http://pandoc.org/MANUAL.html#extension-fenced_divs "More info about pandoc fenced-divs syntax"