!define(TaskList)(

<ul class="task-list">
\1
</ul>

)

!define(Task)(
<li class="task-list-item"><input type="checkbox" disabled=""!ifeq[\1][x][ checked=""]>\2</li>
)
