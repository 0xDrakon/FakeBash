@echo off
if "%~1"=="" exit /b 1
if "%~2"=="" exit /b 1
fc /b "%~1" "%~2" >nul 2>&1
if %errorlevel%==0 (
    echo Files are identical.
) else (
    echo Files differ.
    fc /b "%~1" "%~2"
)
