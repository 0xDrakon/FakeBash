@echo off
if "%~1"=="" exit /b 1
if "%~2"=="" (
    echo %~nx1
) else (
    set name=%~n1
    set ext=%~2
    echo %name%
)
