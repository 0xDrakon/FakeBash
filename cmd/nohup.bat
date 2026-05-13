@echo off
if "%~1"=="" exit /b 1
start /b %* >> nohup.out 2>&1
