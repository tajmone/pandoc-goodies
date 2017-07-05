!comment(Highlight pp-macros set)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"Highlight.pp" v1.4 (2017-07-05)

A set of macros for integrating André Simon's Highlight syntax highlighter with
pandoc documents:

-- http://www.andre-simon.de/

--------------------------------------------------------------------------------
  OUT FORMAT: html
  OS SUPPORT: Win + Linux + macOS
REQUIREMENTS: Highlight cli tool must be available on system %PATH%.
--------------------------------------------------------------------------------
(c) Tristano Ajmone 2017, MIT License.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(HighlightFile)(

<pre class="hl"><code class="\2">!exec[highlight -f -S \2 --no-trailing-nl --validate-input !ifdef(3)(\3) \1]</code></pre>

)

!define(HighlightInlineTheme)(
<style type="text/css">
!exec[highlight --print-style --style=\1 --stdout]
</style>
)


!define(Highlight)(
!add(HLCounter)
!quiet[!lit(!env(PP_MACROS_PATH)_pp-tempfile!HLCounter.tmp)()(\3)]
!quiet[!flushlit]
<pre class="hl"><code class="\1">!exec[highlight -f -S \1 --no-trailing-nl --validate-input !ifdef(2)(\2) !env(PP_MACROS_PATH)_pp-tempfile!HLCounter.tmp]</code></pre>
!ifeq[!os][windows]
[!exec(DEL !env(PP_MACROS_PATH)_pp-tempfile!HLCounter.tmp)]
[!exec(rm !env(PP_MACROS_PATH)_pp-tempfile!HLCounter.tmp)]
)

!define(HLCounter)(0)