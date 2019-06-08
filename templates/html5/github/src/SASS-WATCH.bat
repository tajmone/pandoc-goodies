@ECHO OFF
ECHO.
ECHO 1) Force building SASS project...
ECHO.
CALL SASS --source-map --style=expanded .\GitHub.scss:.\GitHub.css
ECHO.
ECHO ------------------------------------------------------------------------------
ECHO 2) Watching SASS project...
ECHO.
CALL SASS --source-map --style=expanded --watch .\GitHub.scss:.\GitHub.css
EXIT /B
