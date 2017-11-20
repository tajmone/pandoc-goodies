!comment(   "Highlight" pp-macros set   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"Highlight.pp" v2.1.1 (2017-10-26) | PP v2.0

A set of macros for integrating André Simon's Highlight syntax highlighter with
pandoc documents:

-- http://www.andre-simon.de/

------------------------------------------------------------------------------
MACROS LIST:

-- !HighlightFile
-- !Highlight
-- !HighlightInlineTheme

INTERNAL-USE MACROS:

-- !_HLCounter
-- !HighlightSh
-- !HighlightCMD
--------------------------------------------------------------------------------
  OUT FORMAT: html
  OS SUPPORT: Win + Linux + macOS
REQUIREMENTS: Highlight cli tool must be available on system %PATH%.
--------------------------------------------------------------------------------
This file is part of "The Pandoc-Goodies PP-Macros Library":
 -- https://github.com/tajmone/pandoc-goodies/tree/master/pp

(c) Tristano Ajmone 2017, MIT License.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




!comment{  !HighlightFile                                    v2.0 | 2017-10-25 }
````````````````````````````````````````````````````````````````````````````````
DECRIPTION: Syntax highlight the source code file passed in 1st parameter using
    Highlight external tool. The code language must be defined in the 2nd param,
    it will be passed as Highlight's syntax parameter option, and will also be
    added as a class to the <code> & <pre> tags to allow finer styling control
    with custom CSS.
    Optionally:
    -- 3rd parameter can contain extra Highlight invocation options.

USAGE:

        !HighlightFile(FILE)(LANG)[(OPTIONS)]

OUTPUT:

        <pre class="hl LANG"><code class="LANG">
        ... HIGHLIGHTED CODE ...
        </code></pre>

````````````````````````````````````````````````````````````````````````````````
!define(   HighlightFile   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<pre class="hl !2"><code class="!2">!exec
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
highlight -f -S !2 --no-trailing-nl --validate-input !3 -i !1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</code></pre>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





!comment{  !HighlightInlineTheme                             v2.0 | 2017-10-25 }
````````````````````````````````````````````````````````````````````````````````
DECRIPTION: Retrives a Highlight Theme and injects its CSS into the document. 
            A quick solution for theming Highlight code withouth having to import
            an external CSS file via pandoc.

NOTE:       The Theme name must be passed without the ".theme" extension!

USAGE:

        !HighlightInlineTheme(THEME NAME)

````````````````````````````````````````````````````````````````````````````````
!define(   HighlightInlineTheme  )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<style type="text/css">
!exec
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
highlight --print-style --style=!1 --stdout
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</style>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!comment{  !_HLCounter }
````````````````````````````````````````````````````````````````````````````````
** FOR INTERNAL USE ONLY! **
Defines a temporary files counter at module load-time, and sets it to zero.
````````````````````````````````````````````````````````````````````````````````
!define(   _HLCounter   )(0)



!comment{   !Highlight                                     v2.1 | 2017-10-25 }
``````````````````````````````````````````````````````````````````````````````
DECRIPTION: Syntax highlight the source code within the 3rd parameter using
    Highlight external tool. The code language must be defined in 1st param.
    Optionally:
    -- 2nd parameter can contain extra Highlight invocation options.
USAGE:

    !Highlight(LANG)([EXTRA HIGHLIGHT OPTIONS])
    ~~~~~~~~~~~~~~~~
    BLOCK OF SOURCECODE
    ~~~~~~~~~~~~~~~~

NOTES: This macro will first try to establish under which context PP is being
       invoked (ie: Win CMD or Shell/Bash), then calls the appropriate variant
       of the !Highlight macro:
       -- If OS is Windows:
          -- if context is Git Bash:     invoke !HighlightSh
          -- otherwise (context is CMD): invoke !HighlightCMD
       -- If OS is other than Windows:   invoke !HighlightSh   

Under Windows, establishing if the context is Git Bash or Win CMD is done by
checking if the "SHELL" env var exists (ie: it's not empty).
Inside Git Bash for Windows, the "SHELL" env var is available systemwide, its
value being a string pointing to the location of the Bash executable. Eg:

    "C:\Program Files\Git\usr\bin\bash.exe"

If the "!env(SHELL)" macro emits an empty string, we assume that PP is being
invoked from CMD -- it could also be in PowerShell, but we have no means to
check that.
``````````````````````````````````````````````````````````````````````````````
!define(   Highlight   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!ifeq[!os][windows]
[  !comment{ ======== OS Is Windows: ======== }

   !ifne(!env{SHELL})()
   (
        !comment{ ------ Bash/Shell for Windows found: ------ }
        !HighlightSh{!1}{!2}{!3}
   )
   (
        !comment{ ------ We're in Windows CMD: -------------- }
        !HighlightCMD{!1}{!2}{!3}
   )
]
[  !comment{ ======== OS Not Windows: ======== }
   
   !HighlightSh{!1}{!2}{!3}
]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




!comment{   !HighlightCMD                                  v2.1 | 2017-10-25 }
``````````````````````````````````````````````````````````````````````````````
DECRIPTION: The Win CMD version of !Highlight macro, automatically invoked by
            !Highlight after establishing that the current context is Win CMD.
            Used for Windows CMD (not Git Bash for Windows).
USAGE:

    !HighlightCMD(LANG)([EXTRA HIGHLIGHT OPTIONS])
    ~~~~~~~~~~~~~~~~
    BLOCK OF SOURCECODE
    ~~~~~~~~~~~~~~~~

NOTES: This macro creates a temporary file (named “`_pp-tempfileX.tmp`”, where
       `X` is a numeric counter) in the macros folder (`/pp/macros/`) for each
       macro call in the document, to temporarily store the code to highlight.
       At each PP invocation the `X` counter is reset, and the previous temp 
       files are written over. These temporary files are set to be ignored by 
       Git, so you shouldn't worry about them.
``````````````````````````````````````````````````````````````````````````````
!define(HighlightCMD)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!add(_HLCounter)
!def(TEMPFILE)(!env(PP_MACROS_PATH)_pp-tempfile!_HLCounter.tmp)
!quiet[!lit(!TEMPFILE)()(!3)]
!quiet[!flushlit]

<pre class="hl !1"><code class="!1">!exec
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
highlight -f -S !1 --no-trailing-nl --validate-input !2 -i !TEMPFILE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</code></pre>

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




!comment{   !HighlightSh                                   v2.1 | 2017-10-25 }
``````````````````````````````````````````````````````````````````````````````
DECRIPTION: The Shell version of !Highlight macro, automatically invoked by
            !Highlight after establishing the current context is Shell/Bash.
            Used for Linux, Mac and Git Bash for Windows.
USAGE:

    !HighlightSh(LANG)([EXTRA HIGHLIGHT OPTIONS])
    ~~~~~~~~~~~~~~~~
    BLOCK OF SOURCECODE
    ~~~~~~~~~~~~~~~~

NOTES: To disable Shell expansion of the sourcecode block (and errors when
       it contains backtick characters), the "EOF" delimiter string in the
       redirection operator is placed within single quotes:

           cat <<'EOF' |

       (see "Here Documents" for more info)
``````````````````````````````````````````````````````````````````````````````
!define(   HighlightSh   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

<pre class="hl !1"><code class="!1">!sh
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cat <<'EOF' | highlight -f -S !1 --no-trailing-nl --validate-input !2
!3
EOF
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</code></pre>

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
