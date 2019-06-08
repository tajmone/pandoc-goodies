@ECHO OFF
ECHO.
ECHO ==============================================================================
ECHO                  BUILD CSS STYLESHETS FROM SASS SCSS SOURCES                  
ECHO ==============================================================================
:: This script requires Dart Sass to be installed on the system:
::      https://github.com/sass/dart-sass
::
:: On Windows, you can use Chocolatey to install Dart Sass and keep it updated:
::      https://chocolatey.org/packages/sass
::------------------------------------------------------------------------------
ECHO --------------------------------------------------
ECHO Force building SASS project...
ECHO.
CALL SASS --source-map --style=expanded ./:./
ECHO.
CHOICE /C:YN /D:N /T:5 /M "Do you want to watch the Sass project"
IF errorlevel 2 EXIT /B
ECHO --------------------------------------------------
ECHO Watching SASS project...
ECHO.
CALL SASS --source-map --style=expanded --watch ./:./
EXIT /B
