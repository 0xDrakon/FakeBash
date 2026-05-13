@echo off
if "%~1"=="-l" (
    schtasks /query /fo list
) else if "%~1"=="-e" (
    schtasks /query /fo list
    echo Use 'schtasks /create' to schedule tasks on Windows.
) else (
    schtasks %*
)
