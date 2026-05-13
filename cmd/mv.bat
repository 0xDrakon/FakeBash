@echo off
if "%~1"=="" exit /b 1
if "%~2"=="" exit /b 1
move /y "%~1" "%~2" >nul
