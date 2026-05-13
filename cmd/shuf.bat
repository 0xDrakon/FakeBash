@echo off
if "%~1"=="" (
    powershell -Command "$input | Get-Random -Count ([int]::MaxValue)"
) else (
    powershell -Command "Get-Content '%~1' | Get-Random -Count ([int]::MaxValue)"
)
