!comment(GitHub Alerts pp-macros set)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"GFM-Alert.pp" v1.0.1 (2017-04-09)

A set of macros for mimicking GitHub's Alerts (aka flash messages) within pandoc
documents:

-- http://primercss.io/alerts/

--------------------------------------------------------------------------------
  OUT FORMAT: html
  OS SUPPORT: all
REQUIREMENTS: GitHub's Prime-CSS "flash.scss" module must be included in final
			  document's stylesheet:
              https://github.com/primer/primer-alerts/blob/master/lib/flash.scss
--------------------------------------------------------------------------------
(c) Tristano Ajmone 2017, MIT License.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
