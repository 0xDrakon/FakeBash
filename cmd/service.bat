@echo off
if "%~1"=="" exit /b 1
if "%~2"=="start" (
    net start "%~1"
) else if "%~2"=="stop" (
    net stop "%~1"
) else if "%~2"=="restart" (
    net stop "%~1" && net start "%~1"
) else if "%~2"=="status" (
    sc query "%~1"
) else (
    sc %~2 "%~1"
)
