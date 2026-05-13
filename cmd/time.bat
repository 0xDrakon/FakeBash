@echo off
if "%~1"=="" (
    echo %time%
) else (
    set start=%time%
    call %*
    set end=%time%
    echo.
    echo Start: %start%
    echo End:   %end%
)
