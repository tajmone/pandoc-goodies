!comment(   "Inline Formatting" pp-macros set   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"InlineFormatting.pp" v2.0 (2017-10-25) | PP v2.0

A set of shortcut-macros for various standard html inline elements.
--------------------------------------------------------------------------------
MACROS LIST:

- !kbd
- !kbdInlineCSS

--------------------------------------------------------------------------------
  OUT FORMAT: html
  OS SUPPORT: all
--------------------------------------------------------------------------------
This file is part of "The Pandoc-Goodies PP-Macros Library":
 -- https://github.com/tajmone/pandoc-goodies/tree/master/pp

(c) Tristano Ajmone 2017, MIT License.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




!comment{  !kbd                                              v2.0 | 2017-10-25 }
````````````````````````````````````````````````````````````````````````````````
DECRIPTION: Wraps the passed keys in <kbd> tags, separating each key from its
            predecessor with a "+" char. Accepts up to 4 keys.
USAGE:

        !kbd(KEY1)[(KEY2)(KEY3)(KEY4)]

````````````````````````````````````````````````````````````````````````````````
!define(   kbd   )(
<kbd>!1</kbd>!ifdef(2)(+<kbd>!2</kbd>)!ifdef(3)(+<kbd>!3</kbd>)!ifdef(4)(+<kbd>!4</kbd>)
)!comment ``````````````````````````````````  ``````````````````````````````````



!comment{  !kbdInlineCSS                                     v2.0 | 2017-10-25 }
````````````````````````````````````````````````````````````````````````````````
DECRIPTION: Provide GitHub-like CSS styling for <kbd> tags by importing the file
            "kbd_GitHub.css" as an inline stylesheet.

USAGE: Include (once) in your markdown document:

        !kbdInlineCSS

REQUIREMENTS:
  -- Env var PP_MACROS_PATH must be set to the path of this folder in order for
     !kbdInlineCSS to be able to include "kbd_GitHub.css".
````````````````````````````````````````````````````````````````````````````````
!define(   kbdInlineCSS   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<style type="text/css">
!rawinc(!env(PP_MACROS_PATH)kbd_GitHub.css)
</style>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
