!comment(Highlight pp-macros set)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"GFM-TaskList.pp" v1.0.1 (2017-04-09)

A set of macros for enabling GFM task lists within pandoc documents:

-- https://help.github.com/articles/basic-writing-and-formatting-syntax/#task-lists

--------------------------------------------------------------------------------
  OUT FORMAT: html
  OS SUPPORT: all
REQUIREMENTS: CSS defs of "task-list" and "task-list-item" classes (recommended).
			  These classes only hide the items' original bullets, therefore
			  task lists will work even without them: checkboxes will be shown
			  next to the bullet, and look a bit hugly.
--------------------------------------------------------------------------------
(c) Tristano Ajmone 2017, MIT License.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!define(TaskList)(

<ul class="task-list">
\1
</ul>

)

!define(Task)(
<li class="task-list-item"><input type="checkbox" disabled=""!ifeq[\1][x][ checked=""]>\2</li>
)
