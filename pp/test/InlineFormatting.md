!import(RUN-TESTS.pp)

# InlineFormatting PP-Macros Test

# Keystrokes (`<kbd>`)

    !raw(!kbd(KEY1)[(KEY2)(KEY3)(KEY4)])

!kbd(KEY1)(KEY2)(KEY3)(KEY4)

We need the CSS definition for viewing alerts.
We'll use the `!raw(!kbdInlineCSS)` macro to inject the contents of `kbd_GitHub.css` as inline stylesheet:

```
!raw(!kbdInlineCSS)
```

this macro emits the following raw html:

``` html
!kbdInlineCSS
```

!kbdInlineCSS

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