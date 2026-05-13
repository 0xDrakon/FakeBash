@echo off
setlocal enabledelayedexpansion
if "%~3"=="" (
    if "%~2"=="" (
        set start=1
        set step=1
        set end=%~1
    ) else (
        set start=%~1
        set step=1
        set end=%~2
    )
) else (
    set start=%~1
    set step=%~2
    set end=%~3
)
set n=!start!
:loop
if !n! gtr !end! goto :done
echo !n!
set /a n+=!step!
goto :loop
:done
endlocal
