@echo off
if "%~1"=="" (
    sort
) else (
    sort "%~1"
)
