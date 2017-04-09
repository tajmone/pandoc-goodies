:: \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
::  GitHub HTML5 Pandoc Template builder v1.0 (2017-04-08)
::  (c) Tristano Ajmone, 2017. MIT License (MIT).
::  https://github.com/tajmone/pandoc-goodies
:: //////////////////////////////////////////////////////////////////////////////
::
:: SCRIPT REQUIREMENTS: 
:: -- clean-css-cli v. >= 4.0 (Node.js), installed locally or globally):
::    https://www.npmjs.com/package/clean-css-cli
::    https://github.com/jakubpawlowicz/clean-css-cli
:: ------------------------------------------------------------------------------
@ECHO OFF
ECHO.
ECHO ==============================================================================
ECHO Building GitHub html5 pandoc template...
ECHO ==============================================================================
:: ==============================================================================
::                           CHECK SYSTEM REQUIREMENTS                           
:: ==============================================================================
:: Before starting to build, check that all required tools are available:
:: ------------------------------------------------------------------------------
ECHO 1) Checking that system requirement are met.
CALL cleancss -v >nul 2>&1
IF ERRORLEVEL 1 (
    ECHO ERROR! In order to execute this script, you must install clean-css-cli:
    ECHO.
    ECHO   https://www.npmjs.com/package/clean-css-cli
    EXIT /B
)
:: ==============================================================================
::                               BUILD MINIFIED CSS                              
:: ==============================================================================
:: Build a minified and optimized CSS files from multiple sources.
:: ------------------------------------------------------------------------------
ECHO 2) Merging CSS source files into single minified CSS.
CALL cleancss   -O2 ^
                github-markdown.css ^
                markdown-body.css ^
                alerts.css ^
                -o GitHub-Template_B.css
:: ==============================================================================
::                              BUILD HTML5 TEMPLATE                             
:: ==============================================================================
:: The final template is created by concatenating together three source files.
:: Splitting the html template file into two halves after the inline CSS opening
:: tag was the easiest solution (instead of using in-file replacement tools).
:: ------------------------------------------------------------------------------
ECHO 3) Concatenating template source files.
TYPE GitHub-Template_A.html5   >  ..\GitHub.html5
TYPE GitHub-Template_B.css     >> ..\GitHub.html5
TYPE GitHub-Template_C.html5   >> ..\GitHub.html5
:: ------------------------------------------------------------------------------
EXIT /B

:: \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
::                                   CHANGELOG                                   
:: //////////////////////////////////////////////////////////////////////////////
:: v1.0 (2017-04-08) -- First release.