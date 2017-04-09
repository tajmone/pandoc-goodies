!define(buildGFMAlerts)(

<div class="flash-messages">
<div class="flash !ifdef(AlertType)(flash-\AlertType)">
\1
</div>
</div>

)

!define(GFMAlert)(
!buildGFMAlerts
)


!define(GFMWarn)(
!define(AlertType)(warn)
!buildGFMAlerts
)

!define(GFMError)(
!define(AlertType)(error)
!buildGFMAlerts
)

!define(GFMSuccess)(
!define(AlertType)(success)
!buildGFMAlerts
)
