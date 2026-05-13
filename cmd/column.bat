@echo off
if "%~1"=="" (
    powershell -Command "$input | Format-Table -AutoSize"
) else (
    powershell -Command "Get-Content '%~1' | Format-Table -AutoSize"
)
