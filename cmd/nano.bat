@echo off
if "%~1"=="" (
    notepad
) else (
    notepad "%~1"
)
