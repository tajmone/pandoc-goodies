@ECHO OFF
:: ------------------------------------------------------------------------------
:: Invoke "SASS-BUILD.bat" script which force rebuilds the Sass project and also
:: sets the options variable (%_OPTS%) required here.
:: ------------------------------------------------------------------------------
CALL SASS-BUILD.bat
ECHO.
ECHO ------------------------------------------------------------------------------
ECHO 2) Watching SASS project...
ECHO.
CALL SCSS --watch %_OPTS%
EXIT /B
