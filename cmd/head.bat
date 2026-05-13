@echo off
setlocal enabledelayedexpansion
set n=10
set file=
if "%~1"=="-n" (
    set n=%~2
    set file=%~3
) else (
    set file=%~1
)
set count=0
for /f "usebackq delims=" %%l in ("%file%") do (
    if !count! lss %n% (
        echo %%l
        set /a count+=1
    )
)
endlocal
