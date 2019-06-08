@ECHO OFF
ECHO.
ECHO ==============================================================================
ECHO Building GitHub.css from Sass sources
ECHO ==============================================================================
ECHO 1) Force building SASS project...
ECHO.
CALL SASS --source-map --style=expanded .\GitHub.scss:.\GitHub.css
EXIT /B

