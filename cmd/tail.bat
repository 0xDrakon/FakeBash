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
set total=0
for /f "usebackq delims=" %%l in ("%file%") do set /a total+=1
set skip=0
if %total% gtr %n% set /a skip=%total%-%n%
set count=0
for /f "usebackq delims=" %%l in ("%file%") do (
    if !count! geq %skip% echo %%l
    set /a count+=1
)
endlocal
