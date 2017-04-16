!comment(Highlight pp-macros set)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"Highlight.pp" v1.2 (2017-04-16)

A set of macros for integrating André Simon's Highlight syntax highlighter with
pandoc documents:

-- http://www.andre-simon.de/

--------------------------------------------------------------------------------
  OUT FORMAT: html
  OS SUPPORT: All
REQUIREMENTS: Highlight cli tool must be available on system %PATH%.
--------------------------------------------------------------------------------
(c) Tristano Ajmone 2017, MIT License.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(HighlightFile)(

<pre class="hl"><code class="\2">!exec[highlight.exe -f -S \2 --no-trailing-nl --validate-input !ifdef(3)(\3) \1]</code></pre>

)

!define(HighlightInlineTheme)(
<style type="text/css">
!exec[highlight.exe --print-style --style=\1 --stdout]
</style>
)