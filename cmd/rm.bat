@echo off
if "%~1"=="-r" (
    rmdir /s /q "%~2"
) else if "%~1"=="-rf" (
    rmdir /s /q "%~2"
) else if "%~1"=="-f" (
    del /f /q %2 %3 %4 %5 %6 %7 %8 %9
) else (
    del /q %*
)
