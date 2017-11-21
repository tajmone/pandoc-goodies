---
title:      GFM-TaskList PP-Macros Test
pagetitle:  GFM-TaskList Test
...

!import(RUN-TESTS.pp)
!GFMAlertsInlineCSS

This is a run test of the GFM-TaskList pp-macros set.

## Files List

- macros files:
    + [`GFM-TaskList.pp`](../macros/GFM-TaskList.pp) — macros definition module.
    + [`GFM-TaskList.css`](../macros/GFM-TaskList.css) — CSS style for Task List elements.
- extra files:
    + [`github.css`](./github.css) — basic document CSS styling.

## Macros list

!raw{
-   `!TaskList( LIST ELEMENTS )` — Genreate Task List enclosing-tags.
-   `!Task(x| )( TASK TEXT )[( SUB-TASKLIST )]` — Generate a Task element and (optionally) initiate a sub-list.
-   `!TaskListInlineCSS` — Inject required CSS.
}

# Example

## Inject Required CSS

We need some CSS definitions for viewing Task Lists correctly.
We'll use the `!raw(!TaskListInlineCSS)` macro to inject the contents of `GFM-TaskList.css` as an inline stylesheet:

```
!raw(!TaskListInlineCSS)
```

this macro emits the following raw html:

``` html
!TaskListInlineCSS
```

!TaskListInlineCSS

## Create Task Lists

You have different stylistic choices on how to format your Task List macros, especially when dealing with nested lists.

As a general rule, you should use square brackets for `!raw{!Task}` parameters (ie: `!raw{!Task[x][text]}`) as this resembles the GFM syntax and is more user friendly.

### Simple Task List

A simple Task List example:

!def(example)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!TaskList
~~~~~~~~~~~~~~~~~~~~~~~
!Task[x][I'm a _checked_ task]
!Task[ ][I'm an _unchecked_ task]
~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


```
!rawdef(example)
```

!example

### Nesting Task Lists via Indentation

A nested Task List example using brackets and indentation (2 spaces) to visually track sublists:

!def(example)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!TaskList
~~~~~~~~~~~~~~~~~~~~~~~
!Task[ ][Task 1][
  !Task[x][SubTask 1]
  !Task[ ][SubTask 2][
    !Task[x][Sub-SubTask 1]]]
!Task[x][Task 2]
~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

```
!rawdef(example)
```

!example

The indentation-based approach simplifies keeping visual track of levels nesting, but it's easy to loose count of opening and closing brackets.

!GFMAlert
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
__NOTE__: Since sublists are passed via bracketed parameters, they're stripped of leading and trailing whitespace, so indentantion will never break the markdown syntax (ie: four spaces indentation will not be mistaken for an [indented code block]).
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


### Nesting Task Lists via Fencing

A nested Task List example using tildas to wrap sublists:


!def(example)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

```
!rawdef(example)
```

!example

This fenced approach can be more difficult to track visually, but there are less risks of ending up with orphan brackets.

### Nesting Task Lists via Indentation and Fencing

An example combining use of both indentantion and tildas fencing to wrap sublists:


!def(example)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

```
!rawdef(example)
```

!example


!def(badExample)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!TaskList
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!Task[ ][Task]
 ~~~~~~~~~~~~~~~~~~~~~~~~
 !Task[x][SubTask]
  ~~~~~~~~~~~~~~~~~~~
  !Task[x][Sub-SubTask]
    ~~~~~~~~~~~~~~~~
    !Task[x][Sub-Sub-SubTask]
    ~~~~~~~~~~~~~~~~
     ~~~~~~~~~~~~~
     !Task[x][Sub-Sub-Sub-SubTask]
     ~~~~~~~~~~~~~
  ~~~~~~~~~~~~~~~~~~~
 ~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!GFMWarn
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
__WARNING__: Unlike the [indentantion-only approach][Nesting Task Lists via Indentation], this way of styling Task Lists will break formatting if indentation exceeds four spaces:

```
!rawdef(badExample)
```

!badExample

... because whitespace in fenced parameters is preserved, and pandoc will interpret four leading spaces as an [indented code block]. Therefore use it only for Task Lists with limited nesting levels.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!comment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                         REFERENCE LINKS DEFINITIONS                          
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


[indented code block]: http://pandoc.org/MANUAL.html#indented-code-blocks 'See pandoc User Guide on "Indented code blocks"'