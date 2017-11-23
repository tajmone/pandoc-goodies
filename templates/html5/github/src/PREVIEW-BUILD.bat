:: \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
::  GitHub HTML5 Pandoc Template Preview builder v2.0 (2017-11-21)
::  (c) Tristano Ajmone, 2017. MIT License (MIT).
::  https://github.com/tajmone/pandoc-goodies
:: //////////////////////////////////////////////////////////////////////////////
::
:: SCRIPT REQUIREMENTS:
:: -- pandoc >= v2.0 must be available on the system %PATH%:
::    http://pandoc.org
:: -- pp >= v2.1.5 must be available on the system %PATH%:
::    http://cdsoft.fr/pp/
:: ------------------------------------------------------------------------------
@ECHO OFF
ECHO.
ECHO ==============================================================================
ECHO Building GitHub html5 template preview...
ECHO ==============================================================================
:: ==============================================================================
::                           CHECK SYSTEM REQUIREMENTS                           
:: ==============================================================================
:: Before starting to build, check that all required tools are available:
:: ------------------------------------------------------------------------------
ECHO 1) Checking that system requirement are met.
CALL pandoc -v >nul 2>&1
IF ERRORLEVEL 1 (
    ECHO ERROR! In order to execute this script, pandoc must be on the system %%PATH%%:
    ECHO.
    ECHO   http://pandoc.org
    EXIT /B
)
CALL pp -v >nul 2>&1
IF ERRORLEVEL 1 (
    ECHO ERROR! In order to execute this script, pp must be on the system %%PATH%%:
    ECHO.
    ECHO   http://cdsoft.fr/pp/
    EXIT /B
)
:: ==============================================================================
::                             BUILD TEMPLATE PREVIEW                            
:: ==============================================================================
:: Initialize pp-macros environment variable %PP_MACROS_PATH%.
:: ------------------------------------------------------------------------------
ECHO 2) Initalizing pp-macros environment.
:: ------------------------------------------------------------------------------
:: Invoke pp on markdown source and pipe its output to pandoc.
:: ------------------------------------------------------------------------------
CALL ..\..\..\..\pp\macros\INIT-ENV.bat
ECHO 3) Invoking pp preprocessor and piping output to pandoc.
pp  -import %PP_MACROS_PATH%macros.pp ^
    PREVIEW.md ^
  | pandoc  -f markdown ^
            -t html5 ^
            --standalone ^
            --template=..\GitHub.html5 ^
            --highlight-style=haddock ^
            --toc ^
            -o ..\GitHub-Template-Preview.html
:: HIGHLIGHT-STYLES:
:: pygments kate monochrome breezeDark espresso zenburn haddock tango
:: ------------------------------------------------------------------------------
EXIT /B

:: \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
::                                   CHANGELOG                                   
:: //////////////////////////////////////////////////////////////////////////////
:: v2.0 (2017-11-21)
::   -- PP 2.1.5 | pandoc 2.0.2
:: v1.0 (2017-04-08)
::   -- First release.