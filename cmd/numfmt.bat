@echo off
if "%~1"=="" exit /b 1
powershell -Command "'{0:N0}' -f [long]%~1"
