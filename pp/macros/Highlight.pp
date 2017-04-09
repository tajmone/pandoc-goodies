!define(HighlightFile)(

<pre class="hl"><code class="\2">!cmd[highlight.exe -f -S \2 --no-trailing-nl !ifdef(3)(\3) \1]</code></pre>

)

!define(HighlightInlineTheme)(
<style type="text/css">
!cmd[highlight.exe --print-style --style=\1 --stdout]
</style>
)