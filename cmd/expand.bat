@echo off
if "%~1"=="" (
    powershell -Command "$input -replace '\t','    '"
) else (
    powershell -Command "(Get-Content '%~1') -replace '\t','    ' | Set-Content '%~1'"
)
