!comment(RUNTEST)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The RUNTEST macro is a shortcut for display the text emitted by each tested
macro in three ways:

1. Display the macro definition
2. Dispaly the raw emitted text
3. Display the actual macro result
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!def(RUNTEST)(
macro used:

```
!rawdef(TEST)
```

raw html output:

``` html
!TEST
```

result preview:

!TEST
)