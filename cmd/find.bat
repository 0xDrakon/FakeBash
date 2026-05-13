@echo off
setlocal enabledelayedexpansion
set dir=.
set name=
set args=%*
if "%~1"=="" (
    dir /s /b
    exit /b
)
if "%~2"=="-name" (
    dir /s /b "%~1\%~3" 2>nul
) else if "%~1"=="-name" (
    dir /s /b "%~2" 2>nul
) else (
    dir /s /b "%~1" 2>nul
)
endlocal
