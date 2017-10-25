!import(RUN-TESTS.pp)

# GFM-Alerts PP-Macros Test

This is a run test of the __GFM-Alerts__ pp-macros set.

## Files List

- macros files:
    + [`GFM-Alerts.pp`](../macros/GFM-Alerts.pp) — macros definition module.
    + [`GFM-Alerts.css`](../macros/GFM-Alerts.css) — CSS style for GFM-Alerts elements.
- extra files:
    + [`github.css`](./github.css) — basic document CSS styling.

## Macros list

!raw{
-   `!GFMAlertsInlineCSS` — Inject required CSS
-   `!GFMAlert( CONTENTS )` — Default alert (blue)
-   `!GFMError( CONTENTS )` — Error alert (red)
-   `!GFMWarn( CONTENTS )` — Warning alert (yellow)
-   `!GFMSuccess( CONTENTS )` — Success alert (green)
-   `!GFMAlertPlain( CONTENTS )` — Plain alert (grey)
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


## Default Alert

!def(TEST)(!GFMAlert(__Default__ — Lorem ipsum dolor sit amet, pri cu libris dicunt.))

!RUNTEST

## Warning Alert

!def(TEST)(!GFMWarn(__Warning__ — Lorem ipsum dolor sit amet, pri cu libris dicunt.))

!RUNTEST

## Error Alert

!def(TEST)(!GFMError(__Error__ — Lorem ipsum dolor sit amet, pri cu libris dicunt.))

!RUNTEST

## Success Alert

!def(TEST)(!GFMSuccess(__Success__ — Lorem ipsum dolor sit amet, pri cu libris dicunt.))

!RUNTEST

## Plain Alert

__NOTE__: This Alert is not part of GitHub's original set of Alerts; I've added it.

!def(TEST)(!GFMAlertPlain(__Plain__ — Lorem ipsum dolor sit amet, pri cu libris dicunt.))

!RUNTEST


