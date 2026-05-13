@echo off
if "%~1"=="addr" (
    ipconfig /all
) else if "%~1"=="a" (
    ipconfig /all
) else if "%~1"=="route" (
    route print
) else if "%~1"=="r" (
    route print
) else if "%~1"=="link" (
    netsh interface show interface
) else (
    ipconfig /all
)
