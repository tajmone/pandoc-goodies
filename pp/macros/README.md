# PP Macros

    pandoc-goodies/pp/macros/


----------------------------

**Table of Contents**

<!-- #toc -->
<!-- /toc -->

----------------------------

# Files List


- [`CHANGELOG`](./CHANGELOG) --- List changes in macros library.
- [`INIT-ENV.bat`](./INIT-ENV.bat) --- Env setup for using macros library (Win CMD version)
- [`INIT-ENV.sh`](./INIT-ENV.sh) --- Env setup for using macros library (\*nix* shell version)
- [`macros.pp`](./macros.pp) --- Main macros module which loads all others: 
    + __GitHub Alerts__ --- pp-macros set:
        * [`GFM-Alerts.pp`](./GFM-Alerts.pp) --- Macros definition module.
        * [`GFM-Alerts.css`](./GFM-Alerts.css) --- Stylesheet injected by `!GFMAlertsInlineCSS` macro.
        * [`GFM-Alerts.scss`](./GFM-Alerts.scss) --- Sass source file for generating `GFM-Alerts.css`
    + __GFM Task Lists__ --- pp-macros set:
        * [`GFM-TaskList.pp`](./GFM-TaskList.pp) --- Macros definition module.
        * [`GFM-TaskList.css`](./GFM-TaskList.css) --- Stylesheet injected by `!TaskListInlineCSS` macro.
    + __Highlight__ --- pp-macros set:
        - [`Highlight.pp`](./Highlight.pp) --- Macros definition module.
    + __Inline Formatting__ --- pp-macros set:
        * [`InlineFormatting.pp`](./InlineFormatting.pp) --- Macros definition module.
        * [`kbd_GitHub.css`](./kbd_GitHub.css) --- Stylesheet injected by `!kbdInlineCSS` macro.
- [`SASS-BUILD.bat`](./SASS-BUILD.bat) --- Script to compile all Sass files to CSS.