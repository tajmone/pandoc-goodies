:: "INSTALL.bat" v1.0 (2017-04-13) by Tristano Ajmone.
@ECHO OFF
ECHO.
ECHO ==============================================================================
ECHO                      Install GitHub Pandoc HTML5 Template                     
ECHO ==============================================================================
SET "_DEST=%APPDATA%\Pandoc\templates\"
ECHO This script will copy "GitHub.html5" to pandoc's default templates folder for
ECHO the current user, so that it will be always available to pandoc:
ECHO.
ECHO %_DEST%
ECHO.
ECHO Any previous version of the file will be overwritten without confirmation.
ECHO.
:: Ask for confirmation. Defaults to NO after 20 sec timeout (time to read text).
CHOICE /C NY /D N /T 20 /M "Do you wish to install the template"
IF ERRORLEVEL 2 GOTO :DO_INSTALL
ECHO.
ECHO Installation aborted...
EXIT /B

:DO_INSTALL
ECHO.
:: NOTE: XCOPY will create the "templates" subfolder if not present.
XCOPY /Y %~dp0GitHub.html5 %_DEST%
EXIT /B