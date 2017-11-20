@ECHO OFF
CLS
ECHO ==============================================================================
ECHO                            RUNNING PP-MACROS TESTS                            
ECHO ==============================================================================

:: Load the required env-var...
CALL ..\macros\INIT-ENV.bat

:: Run test on every *.md file in this folder...
FOR  %%i  IN (*.md) DO (
    ECHO -- NOW PROCESSING:
    ECHO    %%i
    CALL :PPCONVERT "%%i"
    IF ERRORLEVEL 1 (
        ECHO    ERROR -- Something went wrong! 1>&2
    ) ELSE (
        ECHO    DONE!
    )
)

EXIT /B

:: ==============================================================================
::                               PPCONVERT FUNCTION                              
:: ==============================================================================
:PPCONVERT

pp  %PP_MACROS_PATH%macros.pp ^
    %1 ^
  | pandoc  -f markdown ^
            -t html5 ^
            --css=github.css ^
            --standalone ^
            --smart ^
            --normalize ^
            -o %~n1.html