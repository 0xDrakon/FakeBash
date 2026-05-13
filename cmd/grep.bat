@echo off
if "%~1"=="" exit /b 1
if "%~2"=="" (
    findstr "%~1"
) else (
    findstr "%~1" %2 %3 %4 %5 %6 %7 %8 %9
)
