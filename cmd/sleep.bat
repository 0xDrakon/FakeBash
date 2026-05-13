@echo off
if "%~1"=="" exit /b 1
timeout /t %~1 /nobreak >nul
