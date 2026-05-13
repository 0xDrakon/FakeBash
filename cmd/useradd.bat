@echo off
if "%~1"=="" exit /b 1
net user %~1 /add %2 %3 %4 %5
