@echo off
if "%~1"=="" exit /b 1
if "%~2"=="-d" (
    powershell -Command "Expand-Archive -Path '%~1' -DestinationPath '%~3' -Force"
) else (
    powershell -Command "Expand-Archive -Path '%~1' -DestinationPath '.' -Force"
)
