!comment(   "GitHub Alerts" pp-macros set   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"GFM-Alerts.pp" v2.1 (2017-11-21) | PP v2.0

A set of macros for mimicking GitHub's Alerts (aka flash messages) within pandoc
documents:

-- http://primercss.io/alerts/
------------------------------------------------------------------------------
MACROS LIST:

-- !GFMAlert
-- !GFMAlertWarn
-- !GFMAlertError
-- !GFMAlertSuccess
-- !GFMAlertPlain
-- !GFMAlertsInlineCSS

INTERNAL-USE MACROS:

-- !_buildGFMAlerts
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
This file is part of "The Pandoc-Goodies PP-Macros Library":
 -- https://github.com/tajmone/pandoc-goodies/tree/master/pp

(c) Tristano Ajmone 2017, MIT License.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




!comment{   !_buildGFMAlerts                                 v2.0 | 2017-10-25 }
````````````````````````````````````````````````````````````````````````````````
** FOR INTERNAL USE ONLY! **
````````````````````````````````````````````````````````````````````````````````
!define(   _buildGFMAlerts   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<div class="!ifdef(AlertType)(!AlertType)(Alert)">
!1
</div>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




!comment{   !GFMAlert                                        v2.0 | 2017-10-25 }
````````````````````````````````````````````````````````````````````````````````
DECRIPTION: Wraps the contents of the macro's parameter in GitHub style Alert
            <div>s (aka "Flash messages").
            Contents will be processed as markdown.
USAGE:

    !Alert
    ~~~~~~~~~~~~~~
    MARKDOWN BLOCK
    ~~~~~~~~~~~~~~

````````````````````````````````````````````````````````````````````````````````
!define(   GFMAlert   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!define(   AlertType   )(Alert)
!_buildGFMAlerts(!1)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




!comment
````````````````````````````````````````````````````````````````````````````````
The following macros are just variations of the previous one.
Same usage, different output colors.
````````````````````````````````````````````````````````````````````````````````


!define(   GFMWarn   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!define(   AlertType   )(Warning)
!_buildGFMAlerts(!1)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!define(   GFMError   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!define(   AlertType   )(Error)
!_buildGFMAlerts(!1)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!define(   GFMSuccess   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!define(   AlertType   )(Success)
!_buildGFMAlerts(!1)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!define(   GFMAlertNote   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!define(   AlertType   )(Note)
!_buildGFMAlerts(!1)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



!comment
````````````````````````````````````````````````````````````````````````````````
!GFMAlertPlain is now just an alias to the new !GFMAlertNote --- the latter
being the preferred syntax since it matches the actual class-name.
````````````````````````````````````````````````````````````````````````````````
!define(   GFMAlertPlain   )
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!GFMAlertNote(!1)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





!comment{  !GFMAlertsInlineCSS                               v2.0 | 2017-10-25 }
````````````````````````````````````````````````````````````````````````````````
DECRIPTION: Provide GitHub-like CSS styling for Alerts by importing the file
            "GFM-Alerts.css" as an inline stylesheet.

USAGE: Include (once) in your markdown document:

        !GFMAlertsInlineCSS

REQUIREMENTS:
  -- Env var PP_MACROS_PATH must be set to the path of this folder in order for
     !kbdInlineCSS to be able to include "GFM-Alerts.css".
````````````````````````````````````````````````````````````````````````````````
!define(GFMAlertsInlineCSS)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<style type="text/css">
!rawinc(!env(PP_MACROS_PATH)GFM-Alerts.css)
</style>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

