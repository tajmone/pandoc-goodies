!comment(   "GFM-TaskList" pp-macros set   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"GFM-TaskList.pp" v2.1 (2017-11-22) | PP v2.0

A set of macros for enabling GFM task lists within pandoc documents:

-- https://help.github.com/articles/basic-writing-and-formatting-syntax/#task-lists

------------------------------------------------------------------------------
MACROS LIST:

-- !TaskList
-- !Task
-- !TaskListInlineCSS
--------------------------------------------------------------------------------
  OUT FORMAT: html
  OS SUPPORT: all
REQUIREMENTS: CSS defs of "task-list" and "task-list-item" classes (recommended):
              - Copy/include "GFM-TaskList.css" manually, or
              - Use "!TaskListInlineCSS" macro to inject CSS
              These classes only hide the items' original bullets, therefore
              task lists will work even without them: checkboxes will be shown
              next to the bullet, and look a bit hugly.
--------------------------------------------------------------------------------
This file is part of "The Pandoc-Goodies PP-Macros Library":
 -- https://github.com/tajmone/pandoc-goodies/tree/master/pp

(c) Tristano Ajmone 2017, MIT License.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!comment(   Usage Examples   )
````````````````````````````````````````````````````````````````````````````````
The usage of the TaskList macros is best illustrated by examples.

SIMPLE TASK LIST EXAMPLE:

    !TaskList
    ~~~~~~~~~~~~~~~~
    !Task[ ][Task 1]
    !Task[x][Task 2]
    !Task[ ][ ...  ]
    !Task[ ][Task n]
    ~~~~~~~~~~~~~~~~

NESTED TASK LIST EXAMPLE:

Using brackets and indentation to wrap sublists.

    !TaskList
    ~~~~~~~~~~~~~~~~~~~~~~~
    !Task[ ][Task 1][
      !Task[x][SubTask 1]
      !Task[ ][SubTask 2][
        !Task[x][Sub-SubTask 1]]]
    !Task[x][Task 2]
    ~~~~~~~~~~~~~~~~~~~~~~~

NESTED TASK LIST ALTERNATIVE SYNTAX EXAMPLE:


Using tildas to wrap sublists.


    !TaskList
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    !Task[ ][Task 1]
    ~~~~~~~~~~~~~~~~~~~~~~~~
    !Task[x][SubTask 1]
    !Task[ ][SubTask 2]
    ~~~~~~~~~~~~~~~~~~~
    !Task[x][Sub-SubTask 1]
    ~~~~~~~~~~~~~~~~~~~
    ~~~~~~~~~~~~~~~~~~~~~~~~
    !Task[ ][Task 2]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

````````````````````````````````````````````````````````````````````````````````



!comment{   !TaskList                                        v2.0 | 2017-10-25 }
````````````````````````````````````````````````````````````````````````````````
DECRIPTION: Macro to enclose all Tasks of a Task-List.

````````````````````````````````````````````````````````````````````````````````
!define(   TaskList   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

<ul class="task-list">
!1
</ul>

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!comment{   !Task                                            v2.1 | 2017-11-22 }
````````````````````````````````````````````````````````````````````````````````
DECRIPTION: Macro to define single task-list items.
            The third parameter (optional) can be used to enclose a sublist
            of tasks.

USAGE: !Task( TASK STATE )( TASK TEXT )[( A SUB-TASKS LIST )]

NOTE: Pandoc v2.0.2 failed to handle markdown text in the list element because
      of the "&thinsp;" presence. Therefore I had to change:

          >&thinsp;!2!ifndef(3)(</li>)
      to

          >\ !2!ifndef(3)(</li>)

      using pandoc's backslash-escaped space, which is then parsed as a 
      nonbreaking space. This is a temporary fix until pandoc will handle HTML
      entities in raw HTMl as before. See Issue #4088:

          https://github.com/jgm/pandoc/issues/4088

````````````````````````````````````````````````````````````````````````````````
!define(   Task   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<li class="task-list-item"><input type="checkbox" disabled=""!ifeq[!1][x][ checked=""]>\ !2!ifndef(3)(</li>)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!TaskList(!3)
</li>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!comment{  !TaskListInlineCSS                                v2.0 | 2017-10-25 }
````````````````````````````````````````````````````````````````````````````````
DECRIPTION: Provide GitHub-like CSS styling for GFM Task Lists by importing the
            file "GFM-TaskList.css" as an inline stylesheet.

USAGE: Include (once) in your markdown document:

        !TaskListInlineCSS

REQUIREMENTS:
  -- Env var PP_MACROS_PATH must be set to the path of this folder in order for
     !kbdInlineCSS to be able to include "GFM-TaskList.css".
````````````````````````````````````````````````````````````````````````````````
!define(TaskListInlineCSS)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<style type="text/css">
!rawinc(!env(PP_MACROS_PATH)GFM-TaskList.css)
</style>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
