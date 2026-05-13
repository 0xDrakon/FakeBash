@echo off
if "%~1"=="" exit /b 1
echo %~1| findstr /r "^[0-9]*$" >nul
if %errorlevel%==0 (
    taskkill /pid %~1 /f
) else (
    taskkill /im %~1 /f
)
