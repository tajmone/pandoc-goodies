---
title:      InlineFormatting PP-Macros Test
pagetitle:  InlineFormatting Test
...

!import(RUN-TESTS.pp)

This is a run test of the __Inline Formatting__ pp-macros set.

## Files List

- macros files:
    + [`InlineFormatting.pp`](../macros/InlineFormatting.pp) — macros definition module.
    + [`kbd_GitHub.css`](../macros/kbd_GitHub.css) — CSS style for keystrokes.
- extra files:
    + [`github.css`](./github.css) — basic document CSS styling.

## Macros list

!raw{
-   `!kbd( KEY1 )[( KEY2 )( KEY3 )( KEY4 )]` — keystrokes in `<kbd>` tags.
-   `!kbdInlineCSS` — Inject required CSS (“`kbd_GitHub.css`”)
}

# Keystrokes (`<kbd>`)

The `!raw(!kbd)` macro is a fast way to represent up to four Keystrokes. It has the following syntax:

    !raw(!kbd( KEY1 )[( KEY2 )( KEY3 )( KEY4 )])

... where only the first parameter is mandatory.

Example:

!kbd(KEY1)(KEY2)(KEY3)(KEY4)

## Keystrokes CSS

We need a custom CSS definition for viewing Keystrokes properly.
We'll use the `!raw(!kbdInlineCSS)` macro to inject the contents of `kbd_GitHub.css` as inline stylesheet:

```
!raw(!kbdInlineCSS)
```

this macro emits the following raw html:

``` html
!kbdInlineCSS
```

!kbdInlineCSS

Now the CSS definition is available document-wide and you'll see it aplied to the Keystroke examples herein.

Of course, you can use your own CSS definitions instead of the one produced by the `!raw(!kbdInlineCSS)` macro. This macro is just a convenient quick solution.

## Single Key

!def(TEST)(!kbd(CANC))

!RUNTEST

## Two Keys

!def(TEST)(!kbd(Ctr)(Z))

!RUNTEST

## Three Keys

!def(TEST)(!kbd(Ctr)(SHIFT)(S))

!RUNTEST

## Four Keys

!def(TEST)(!kbd(Ctrl)(SHIFT)(Alt-GR)(j))

!RUNTEST