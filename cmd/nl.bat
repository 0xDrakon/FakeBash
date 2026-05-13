@echo off
setlocal enabledelayedexpansion
if "%~1"=="" exit /b 1
set n=0
for /f "usebackq delims=" %%l in ("%~1") do (
    set /a n+=1
    echo     !n!	%%l
)
endlocal
