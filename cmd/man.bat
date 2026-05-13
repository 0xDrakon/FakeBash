@echo off
if "%~1"=="" exit /b 1
help %~1 2>nul || (
    echo No manual entry for %~1
    echo Try: %~1 /?
    %~1 /?
)
