@echo off
if "%~1"=="-p" (
    md "%~2" 2>nul
) else (
    md %*
)
