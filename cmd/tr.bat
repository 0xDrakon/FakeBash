@echo off
if "%~1"=="" exit /b 1
if "%~2"=="" exit /b 1
powershell -Command "$input | ForEach-Object { $_ -replace '%~1','%~2' }"
