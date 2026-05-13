@echo off
setlocal enabledelayedexpansion
if "%~1"=="" exit /b 1
set prev=
for /f "usebackq delims=" %%l in ("%~1") do (
    if not "%%l"=="!prev!" (
        echo %%l
        set prev=%%l
    )
)
endlocal
