@echo off
if "%~1"=="" exit /b 1
if "%~2"=="" exit /b 1
fc "%~1" "%~2"
