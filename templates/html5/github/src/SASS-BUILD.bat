@ECHO OFF
ECHO.
ECHO ==============================================================================
ECHO Building GitHub.css from Sass sources
ECHO ==============================================================================
SET _STYLE=nested
:: STYLES:  compact  |  compressed  |  expanded  |  nested (default)
SET _SMAP=auto
:: auto (default): relative paths where possible, file URIs elsewhere
:: file: always absolute file URIs
:: inline: include the source text in the sourcemap
:: none: no sourcemaps
SET "_OPTS=.\GitHub.scss:.\GitHub.css --sourcemap=%_SMAP% --style=%_STYLE%"
ECHO SASS OPTIONS:
ECHO    %_OPTS%
ECHO ------------------------------------------------------------------------------
ECHO 1) Force building SASS project...
ECHO.
CALL SCSS --update --force %_OPTS%
EXIT /B

