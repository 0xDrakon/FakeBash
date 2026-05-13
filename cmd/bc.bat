@echo off
if "%~1"=="" (
    powershell -NoLogo -Command "$expr = Read-Host; [Math]::Round(($expr | Invoke-Expression), 10)"
) else (
    powershell -NoLogo -Command "[Math]::Round((%*), 10)"
)
