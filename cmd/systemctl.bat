@echo off
if "%~1"=="start" (
    net start "%~2"
) else if "%~1"=="stop" (
    net stop "%~2"
) else if "%~1"=="restart" (
    net stop "%~2" && net start "%~2"
) else if "%~1"=="status" (
    sc query "%~2"
) else if "%~1"=="enable" (
    sc config "%~2" start= auto
) else if "%~1"=="disable" (
    sc config "%~2" start= disabled
) else if "%~1"=="list-units" (
    sc query type= all
) else (
    sc %*
)
