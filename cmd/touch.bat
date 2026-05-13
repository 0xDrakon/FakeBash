@echo off
if "%~1"=="" exit /b 1
if exist "%~1" (
    copy /b "%~1" +,, "%~1" >nul 2>&1
) else (
    type nul > "%~1"
)
