@echo off
setlocal enabledelayedexpansion
if "%~1"=="" exit /b 1
set lines=0
set words=0
set chars=0
for /f "usebackq delims=" %%l in ("%~1") do (
    set /a lines+=1
    set line=%%l
    for %%w in (%%l) do set /a words+=1
)
for /f %%c in ('type "%~1" ^| find /c /v ""') do set lines=%%c
echo %lines% lines in %~1
endlocal
