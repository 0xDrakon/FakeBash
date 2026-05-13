@echo off
if "%~1"=="" exit /b 1
net user %~1 /delete
