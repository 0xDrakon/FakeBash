@echo off
if "%~1"=="" (
    more
) else (
    more "%~1"
)
