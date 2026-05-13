@echo off
setlocal enabledelayedexpansion
if "%~1"=="" exit /b 1
set lines=1000
set prefix=x
if "%~2"=="" (
    set file=%~1
) else (
    set lines=%~1
    set lines=!lines:-l=!
    set file=%~2
)
set n=0
set part=0
for /f "usebackq delims=" %%l in ("%file%") do (
    set /a n+=1
    if !n! gtr !lines! (
        set /a part+=1
        set n=1
    )
    echo %%l>> %prefix%!part!.txt
)
endlocal
