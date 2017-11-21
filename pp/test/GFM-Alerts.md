---
title:      GFM-Alerts PP-Macros Test
pagetitle:  GFM-Alerts Test
...

!import(RUN-TESTS.pp)

This is a run test of the **GFM-Alerts** pp-macros set.

# Files List

- macros files:
    + [`GFM-Alerts.pp`](../macros/GFM-Alerts.pp) — macros definition module.
    + [`GFM-Alerts.css`](../macros/GFM-Alerts.css) — CSS style for GFM-Alerts elements.
- extra files:
    + [`github.css`](./github.css) — basic document CSS styling.

# Macros list

!raw{
-   `!GFMAlertsInlineCSS` — Inject required CSS
-   `!GFMAlert( CONTENTS )` — **Alert** (blue)
-   `!GFMError( CONTENTS )` — **Warning** (red)
-   `!GFMWarn( CONTENTS )` — **Error** (yellow)
-   `!GFMSuccess( CONTENTS )` — **Success** (green)
-   `!GFMAlertNote( CONTENTS )` — **Note** (grey)
-   `!GFMAlertPlain( CONTENTS )` — same as Note (alias of `!GFMAlertNote`)
}

# Add Alerts CSS

We need the CSS definition for viewing alerts.
We'll use the `!raw(!GFMAlertsInlineCSS)` macro to inject the contents of `GFM-Alerts.css` as an inline stylesheet:

```
!raw(!GFMAlertsInlineCSS)
```

this macro emits the following raw html:

``` html
!GFMAlertsInlineCSS
```

!GFMAlertsInlineCSS


# Alerts Tests

## Default Alert

!def(TEST)(!GFMAlert(**Default** --- Lorem ipsum dolor sit amet, pri cu libris dicunt.))

!RUNTEST

## Warning Alert

!def(TEST)(!GFMWarn(**Warning** --- Lorem ipsum dolor sit amet, pri cu libris dicunt.))

!RUNTEST

## Error Alert

!def(TEST)(!GFMError(**Error** --- Lorem ipsum dolor sit amet, pri cu libris dicunt.))

!RUNTEST

## Success Alert

!def(TEST)(!GFMSuccess(**Success** --- Lorem ipsum dolor sit amet, pri cu libris dicunt.))

!RUNTEST

## Note Alert

> **NOTE**: This Alert is not part of GitHub's original set of Alerts; I've added it.

!def(TEST)(!GFMAlertNote(**Note** --- Lorem ipsum dolor sit amet, pri cu libris dicunt.))

!RUNTEST

## Plain Alert

> **NOTE**: `!raw(!GFMAlertPlain)` is just an alias of `!raw(!GFMAlertNote)`!
> The latter is the preferred syntax because it resembles the actual class
> name used in the `<div>` tag. 

!def(TEST)(!GFMAlertPlain(**Plain** --- Lorem ipsum dolor sit amet, pri cu libris dicunt.))

!RUNTEST

--------------------------------------

# Pandoc New Fenced Divs

Pandoc 2.0 introduced the [`fenced_divs`] extension which allows special fenced syntax for native Div blocks. Pandoc markdown flavour supports this extension by default, and it can optionally be enabled for other markdown flavours too. 

Fenced divs can be used instead of PP Alert macros, achieving the same effect:

!def(TEST)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::: Warning ::::::
**Warning** --- This is a Warning-Alert.
::::::::::::::::::
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!RUNSIMPLETEST

... where you only need to insert after the opening `:::`  the class name of the desired GFM-Alert --- ie: one of:

- `.Alert`
- `.Warning`
- `.Error`
- `.Success`
- `.Note`

## Advantages

Using fenced divs has the advantage of not injecting raw HTML into the document, allowing conversion to other formats too. Furthermore, the fenced divs syntax allows to specify multiple classes and an identifier:

!def(TEST)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::: { .Success #custom-id .other-class } ::::::
**Success** --- This is a Success-Alert.
::::::::::::::::::
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!RUNSIMPLETEST

... which in the final HTML produces the following `<div>` tag:

``` html
<div id="custom-id" class="Success other-class">
```


[`fenced_divs`]: http://pandoc.org/MANUAL.html#extension-fenced_divs "Link to pandoc documentation on 'fenced-divs'"