@echo off
if "%~1"=="dev" (
    netsh interface show interface
) else if "%~1"=="con" (
    netsh wlan show profiles
) else (
    netsh %*
)
