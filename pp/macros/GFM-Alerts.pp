!comment(GitHub Alerts pp-macros set)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"GFM-Alerts.pp" v1.0.2 (2017-04-10)

A set of macros for mimicking GitHub's Alerts (aka flash messages) within pandoc
documents:

-- http://primercss.io/alerts/

--------------------------------------------------------------------------------
  OUT FORMAT: html
  OS SUPPORT: all
REQUIREMENTS:
  -- "GFM-Alerts.css" must be included in final document's stylesheet.
	 (Adapted from GitHub's Prime-CSS "flash.scss" module:)
     https://github.com/primer/primer-alerts/blob/master/lib/flash.scss
  -- Env var PP_MACROS_PATH must be set to the path of this folder in order for
     !GFMAlertsInlineCSS to be able to include "GFM-Alerts.css".
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

!define(GFMAlertPlain)(
!define(AlertType)(plain)
!buildGFMAlerts
)

!define(GFMAlertsInlineCSS)(
<style type="text/css">
!rawinc(!env(PP_MACROS_PATH)GFM-Alerts.css)
</style>
)