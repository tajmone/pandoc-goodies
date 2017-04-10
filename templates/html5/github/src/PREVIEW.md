--------------------------------

This is a preview of “_GitHub Pandoc HTML5 Template_” __v1.1__, © Tristano Ajmone 2017, MIT License (MIT).

__CSS Styling__: This template supports styling for all the standard markdown elements, some GitHub flavored markdown elements (task lists, etc.), and some of GitHub's advanced CSS styling (alerts) via the custom pp macros of the [Pandoc-Goodies](https://github.com/tajmone/pandoc-goodies) project.

__Template Variables__: This template supports all the standard pandoc template variables, but also allows overriding them with some custom variables. The template was adapted from the default html5 template that shipped with <mark>__pandoc v1.19.2.1__</mark>.

Standard Typography
===================

Lorem markdownum stagna *de spatiantes* mirabatur **arboribus at nunc**, somnus sanguine quosque ~~genusque addenda socia~~.[^1] <mark>Plus ipsisque latent</mark>, genus, medio aut rima haberet.

Quem palluerat, vulgaris pignora: <kbd>Crtl</kbd>+<kbd>Z</kbd>.[^2]

> Et vult Ulixe nec mater moras veluti spatio omnia sub quemque ripas ubi. Nil non, sub nec, ubi ferant deus pacis Turni, parentum.
>
> > Ut nobis Ampycides esset indigenae eiecit domini successibus Aiaci tecta nunc terris, Argolica videres est neque. Aeacides caloris, magna canes.[^3]

[^1]: Nec opus caecoque frondibus fervet.
[^2]: Hora sequantur *nimium exiguis et* in fit coniuge aures, adfuit.
[^3]: Turni, parentum. Ut nobis Ampycides esset indigenae eiecit domini successibus Aiaci tecta nunc terris, Argolica videres est neque. Aeacides caloris, magna canes.

1.  Nec et tormenta tacitae decet aethere
2.  Nullamque corpus
    1.  Sic nunc naides dubiis
    2.  Virgo forti ardent
    3.  Dic pro captantur exitus quo viris infera
3.  Adit Symplegadas inque

-   Dic pro captantur exitus quo viris infera
-   Humanam tenderet
    -   Est esset devoveas
    -   Adit Symplegadas inque
-   Lelex ad ira
-   Inpositus cum genus extulit nec inseris ille

<h1>h1</h1>
<h2>h2</h2>
<h3>h3</h3>
<h4>h4</h4>
<h5>h5</h5>
<h6>h6</h6>


``` python
#! python

# Fibonacci series
a, b = 0, 1
while b < 200:
       print b,
       a, b = b, a+b
```

Definition lists
----------------

Term 1

: Definition 1

Term 2 with <mark>inline markup</mark>

: Definition 2

    Hora sequantur *nimium exiguis et* in fit coniuge aures, adfuit.

    Ut sentesflumen, mea ira, et ubi manus silicem.

| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell     | _Cell_   | __Cell__ |
| `Cell`   | Cell     | Cell     |

Pandoc Markdown
===============

Line blocks
-----------

| The limerick packs laughs anatomical
| In space that is quite economical.
|    But the good ones I've seen
|    So seldom are clean
| And the clean ones so seldom are comical


GFM Features
============

Inline text elements
--------------------

You can use the mark tag to <mark>highlight</mark> text.</p>

~~This line of text is meant to be treated as deleted text.~~

Keystroke can be rendered with `<key>` tag: <kbd>Shift</kbd>+<kbd>U</kbd>

Task Lists
-----------

GFM Task Lists can be used within pandoc markdown documents through our custom pp macros. Example:

    !raw(
    !TaskList(
    !Task[x][I'm a _checked_ task]
    !Task[ ][I'm an _unchecked_ task]
    )
    )

... will produce:

!TaskList(
!Task[x][I'm a _checked_ task]
!Task[ ][I'm an _unchecked_ task]
)

GitHub Extended CSS Features
============================

Alerts
------

Alerts (aka _flash messages_) are part of GitHub's __Primer CSS__, and they are available in documents previews:

-   <http://primercss.io/alerts/>

These are the different type of alerts available, along with the custom pp-macros to generate them inside markdown source:

!GFMAlert(__Default alert__ — Created with the `!raw(!GFMAlert(TEXT))` pp macro.)

!GFMWarn(__Warning alert__ — Created with the `!raw(!GFMWarn(TEXT))` pp macro.)

!GFMError(__Error alert__ — Created with the `!raw(!GFMError(TEXT))` pp macro.)

!GFMSuccess(__Success alert__ — Created with the `!raw(!GFMSuccess(TEXT))` pp macro.)

!GFMAlertPlain(__Plain alert__ — Created with the `!raw(!GFMAlertPlain(TEXT))` pp macro.

This alert is not part of the original set of GitHub Alerts, it's a custom addition.)

The macro's parameter will be treated as markdown content if pandoc's `markdown_in_html_blocks` extension is enabled (default in pandoc markdown):

    !raw(!GFMAlert(
    This alert contains __markdown__ formatting and _spans_ over <mark>multiple paragraphs</mark>.

    Any `markdown` element and block can be placed inside the alert:

    - List item
    - List item
    - List item
    ))

!GFMAlert(
This alert contains __markdown__ formatting and _spans_ over <mark>multiple paragraphs</mark>.

Any `markdown` element and block can be placed inside the alert:

- List item
- List item
- List item
)



Extra Template Variables
========================

Beside supporting all the standard pandoc variables (pandoc 1.19.2.1), some extra variables were added to the template to allow finer customization.

The variables `title`, `author` and `date` all have a counterpart with the `docmeta-` prefix added to their name (ie: `docmeta-title`, `docmeta-author` and `docmeta-date`). These alternative variables are intended to be used in the `<meta>` elements of the `<head>` section in the html source. If an alternative `docmeta-` variable is found, it will be used instead of its default conterpart to fill the metadata; if not, the default (unprefixed) variable will be employed as usual.

This can be exploited to produce a different text in the `<title>` tag and the actual document’s title, or to display authors names only in the source `<meta>` elements but not in the actual document (ie: by setting only the `docmeta-` variable).

For an example of their usage, see the [`preview.yaml`](./src/preview.yaml) file in the `src` folder, and examine the template source code.

The use of the alternative variables is completely optional, and by ignoring them the template will follow the conventional variables system of the default pandoc templates.


| default var | alternative var  |
|-------------|------------------|
| `title`     | `docmeta-title`  |
| `author`    | `docmeta-author` |
| `date`      | `docmeta-date`   |
  