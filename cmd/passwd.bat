@echo off
if "%~1"=="" (
    net user %username% *
) else (
    net user %~1 *
)
