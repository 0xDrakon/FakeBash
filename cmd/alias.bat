@echo off
if "%~1"=="" (
    doskey /macros
) else (
    doskey %*
)
