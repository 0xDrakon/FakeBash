@echo off
if "%~1"=="" exit /b 1
powershell -Command "Format-Hex '%~1'"
