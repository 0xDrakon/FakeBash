@echo off
if "%~1"=="" exit /b 1
powershell -Command "Start-Process cmd -ArgumentList '/c %*' -Verb RunAs"
