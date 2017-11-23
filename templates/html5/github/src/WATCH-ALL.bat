@ECHO OFF
ECHO ==============================================================================
ECHO                                WATCH ALL SCRIPT                               
ECHO ==============================================================================
::  "WATCH-ALL.bat" v1.0 | 2017/11/20 | by Tristano Ajmone
::  ------------------------------------------------------------------------------
::  SCRIPT REQUIREMENTS: 
::  -- multiwatch (Node.js)
::     https://www.npmjs.com/package/multiwatch
::  ==============================================================================
::                                    WATCH SASS                                  
::  ==============================================================================
::  Launch in another CMD window "SASS-WATCH.bat" script which will:
::  1. Force compile the SCSS source files.
::  2. Watch the SCSS source files and recompile them if they change.
::  ------------------------------------------------------------------------------
START "SASS WATCH" CMD /C SASS-WATCH.bat
::  ==============================================================================
::                          WATCH TEMPLATE AND PREVIEW DOC                        
::  ==============================================================================
::  Invoke multiwatch to watch the template source files and the template-preview 
::  files, and launch the required build script if any file changes are detected. 
::  ------------------------------------------------------------------------------
multiwatch  GitHub.css ^
            GitHub_source.html5 ^
            --execute "TEMPLATE-BUILD.bat --no-sass" ^
            ..\GitHub.html5 ^
            PREVIEW.md ^
            --execute "PREVIEW-BUILD.bat"
:: \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
::                                   CHANGELOG                                   
:: //////////////////////////////////////////////////////////////////////////////
:: v1.0 (2017-11-20)
::   -- First release.
