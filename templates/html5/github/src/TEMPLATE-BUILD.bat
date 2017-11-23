:: \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
::  GitHub HTML5 Pandoc Template builder v2.0 (2017-11-21)
::  (c) Tristano Ajmone, 2017. MIT License (MIT).
::  https://github.com/tajmone/pandoc-goodies
:: //////////////////////////////////////////////////////////////////////////////
::
:: Invoke with "--no-sass" to skip build-css step.
::
:: SCRIPT REQUIREMENTS: 
:: -- clean-css-cli v. >= 4.1 (Node.js), installed locally or globally):
::    https://www.npmjs.com/package/clean-css-cli
::    https://github.com/jakubpawlowicz/clean-css-cli
:: ------------------------------------------------------------------------------
@ECHO OFF
ECHO.
ECHO ==============================================================================
ECHO Building GitHub html5 pandoc template...
ECHO ==============================================================================
:: Check if "--no-sass" option was used:
IF "%~1"=="--no-sass" (
    ECHO "--no-sass" option: CSS creation from Sass will be skipped
    ECHO.
    )
:: Create steps counter var:
SET _STEP=1
:: ==============================================================================
::                           CHECK SYSTEM REQUIREMENTS                           
:: ==============================================================================
:: Before starting to build, check that all required tools are available:
:: ------------------------------------------------------------------------------
ECHO %_STEP%) Checking that system requirement are met.
CALL cleancss -v >nul 2>&1
IF ERRORLEVEL 1 (
    ECHO ERROR! In order to execute this script, you must install clean-css-cli:
    ECHO.
    ECHO   https://www.npmjs.com/package/clean-css-cli
    EXIT /B
)
SET /A _STEP+=1
:: ==============================================================================
::                          BUILD CSS FROM SASS SOURCES                          
:: ==============================================================================
:: Check if "--no-sass" option was used:
IF "%~1"=="--no-sass" GOTO :MINIFY
ECHO %_STEP%) Creating CSS file from Sass sources.
CALL SASS-BUILD.bat 1>nul
SET /A _STEP+=1
:: ==============================================================================
::                               BUILD MINIFIED CSS                              
:: ==============================================================================
:: Build a minified and optimized CSS files from multiple sources.
:: ------------------------------------------------------------------------------
:MINIFY
ECHO %_STEP%) Minifying CSS file.
CALL cleancss   -O2 ^
                GitHub.css ^
                -o GitHub.min.css
SET /A _STEP+=1
:: ==============================================================================
::                              BUILD HTML5 TEMPLATE                             
:: ==============================================================================
:: The final template is created via a Node.js script that injects the minified
:: CSS file into a placholder string ("{{CSS-INJECT}}") in the template's template
:: file ("sourceGitHub.html5") and then writes to file the final template.
:: ------------------------------------------------------------------------------
ECHO %_STEP%) Injecting minified CSS into template source file.
CALL NODE css-injector.js
:: ------------------------------------------------------------------------------
EXIT /B

:: \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
::                                   CHANGELOG                                   
:: //////////////////////////////////////////////////////////////////////////////
:: v2.0 (2017-11-21)
::   -- Inject CSS-file into "GitHub_source.html5" via "TEMPLATE-INJECT-CSS.js"
::      script (Node.js) instead of joining multiple split files.
::   -- Also compiles CSS from Sass sources.
::   -- Sass to CSS compilation step can be skipped via "--no-sass" parameter.
:: v1.0 (2017-04-08)
::   -- First release.