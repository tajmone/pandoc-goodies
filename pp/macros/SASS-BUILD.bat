@ECHO OFF
ECHO.
ECHO ==============================================================================
ECHO                  BUILD CSS STYLESHETS FROM SASS SCSS SOURCES                  
ECHO ==============================================================================
::	 This script will compile to CSS all SCSS files found in this folder.
::   ------------------------------------------------------------------------------
SET _STYLE=nested
:: STYLES:  compact  |  compressed  |  expanded  |  nested (default)
SET _SMAP=none
:: auto (default): relative paths where possible, file URIs elsewhere
:: file: always absolute file URIs
:: inline: include the source text in the sourcemap
:: none: no sourcemaps
SET "_OPTS=./:./ --sourcemap=%_SMAP% --style=%_STYLE%"
ECHO SASS OPTIONS:
ECHO    %_OPTS%
ECHO --------------------------------------------------
ECHO Force building SASS project...
ECHO.
CALL SCSS --update --force %_OPTS%
ECHO.
CHOICE /C:YN /D:N /T:5 /M "Do you want to watch the Sass project"
IF errorlevel 2 EXIT /B
ECHO --------------------------------------------------
ECHO Watching SASS project...
ECHO.
CALL SCSS --watch %_OPTS%

