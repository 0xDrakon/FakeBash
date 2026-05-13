@echo off
if "%~1"=="-aux" (
    tasklist /v
) else if "%~1"=="-a" (
    tasklist /v
) else (
    tasklist %*
)
