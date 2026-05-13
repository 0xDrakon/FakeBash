@echo off
if "%~1"=="install" (
    winget install %2 %3 %4 %5 %6
) else if "%~1"=="remove" (
    winget uninstall %2 %3 %4 %5 %6
) else if "%~1"=="update" (
    winget upgrade --all
) else if "%~1"=="search" (
    winget search %2 %3 %4 %5 %6
) else if "%~1"=="list" (
    winget list
) else (
    echo apt: unknown command %~1
    echo Supported: install, remove, update, search, list
)
