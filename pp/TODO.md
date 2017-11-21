PP-Macros TODO List
===================

Annotated list of pending macros changes and incubating ideas for the future…

Feel free to add to this list new features you’d like to see implemented.

High Priority
=============

## CSS Problems

- [x] `GFM-TaskList.css`:
    - [x] fix `<p>` styles --- Pandoc v2 is forcing paragraphs in list elements, which is causing too much spacing between list elements.

Change Existing Macros
----------------------

New Macros
----------

- [ ] A macro for inecting inline CSS for Pandoc Line blocks --- As of v2.x pandoc no longer adds inline CSS to Line blocks, but relies on the "`line-block`" class instead:
    ``` css
    div.line-block {
      white-space: pre-line;
    }
    ```
- [ ]  `!mark(TEXT)` — shortcut to: `<mark>TEXT</mark>`

Lower Priority
==============

- [ ]  **InlineFormatting**
    - [ ]  `!kbd` provide different on-the-fly CSS stylings:
        - [ ]  <https://auth0.github.io/kbd/>
        - [ ]  <https://github.com/michaelhue/keyscss>
        - [ ]  <http://html.com/tags/kbd/>

Wishlist
========

-   Pygments highlighting
-   Highlight.js highlighting — via Node cli, not in-browser.
-   Inegrate [RegEx Colorizer](https://github.com/slevithan/regex-colorizer) (JS flavored RegExes highlighter)
-   AsciiDoctor integration
-   Font Awesome “on demand” — a macro to include a FA icon as inline CSS, another macro to actually display (via CSS).
-   ~~[emoji](https://github.com/WebpageFX/emoji-cheat-sheet.com/) macros~~ (pandoc v2 supports them  via [emoji extension](http://pandoc.org/MANUAL.html#extension-emoji))

