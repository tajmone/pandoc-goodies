!comment(   "Highlight" pp-macros set   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"Highlight.pp" v2.0 (2017-10-25) | PP v2.0

A set of macros for integrating André Simon's Highlight syntax highlighter with
pandoc documents:

-- http://www.andre-simon.de/

------------------------------------------------------------------------------
MACROS LIST:

-- !HighlightFile

INTERNAL-USE MACROS:

-- !_HLCounter
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

NOTE: 		The Theme name must be passed without the ".theme" extension!

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
````````````````````````````````````````````````````````````````````````````````
!define(   _HLCounter   )(0)


!define(Highlight)
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


