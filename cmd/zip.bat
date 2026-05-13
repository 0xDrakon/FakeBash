@echo off
if "%~1"=="" exit /b 1
if "%~2"=="" exit /b 1
powershell -Command "Compress-Archive -Path '%~2' -DestinationPath '%~1' -Force"
