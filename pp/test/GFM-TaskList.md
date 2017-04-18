!import(RUN-TESTS.pp)


# GFM-TaskList PP-Macros Test

This is a run test of the GFM-TaskList pp-macros set.

    macros module: GFM-TaskList.pp
    related files: GFM-TaskList.css

    Macros list:
!raw{
-   `!TaskList(LIST ELEMENTS)` — Genreated Task List enclosing tags.
-   `!Task(x | )(ELEMENT CONTENTS)` — Generate a Task element.
-   `!TaskListInlineCSS` — Inject required CSS
}

# Example

## Inject Required CSS

We need some CSS definitions for viewing task lists correctly.
We'll use the `!raw(!TaskListInlineCSS)` macro to inject the contents of `GFM-TaskList.css` as an inline stylesheet:

```
!raw(!TaskListInlineCSS)
```

this macro emits the following raw html:

``` html
!TaskListInlineCSS
```

!TaskListInlineCSS

## Create Task List

And now a task list.

```
!raw{
!TaskList(
!Task[x][I'm a _checked_ task]
!Task[ ][I'm an _unchecked_ task]
)
}
```

!TaskList(
!Task[x][I'm a _checked_ task]
!Task[ ][I'm an _unchecked_ task]
)