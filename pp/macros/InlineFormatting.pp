!comment(InlineFormatting)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"InlineFormatting.pp" v1.0 (2017-04-11)

A set of shortcut-macros for various standard html inline elements:

- !kbd

--------------------------------------------------------------------------------
  OUT FORMAT: html
  OS SUPPORT: all
--------------------------------------------------------------------------------
(c) Tristano Ajmone 2017, MIT License.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment{  !kbd(KEY1)[(KEY2)(KEY3)(KEY4)]  }
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Wraps the passed keys in <kbd> tags, separating each key from its predecessor
with a "+" char. Accepts up to 4 keys.
--------------------------------------------------------------------------------
(c) Tristano Ajmone 2017, MIT License.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(kbd)(
<kbd>\1</kbd>!ifdef(2)(+<kbd>\2</kbd>)!ifdef(3)(+<kbd>\3</kbd>)!ifdef(4)(+<kbd>\4</kbd>)
)

!define(kbdInlineCSS)(
<style type="text/css">
!rawinc(!env(PP_MACROS_PATH)kbd_GitHub.css)
</style>
)