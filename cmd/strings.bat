@echo off
if "%~1"=="" exit /b 1
strings "%~1" 2>nul || (
    findstr /r "[a-zA-Z0-9_\-\.\ ]\{4,\}" "%~1"
)
