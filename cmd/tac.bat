@echo off
setlocal enabledelayedexpansion
if "%~1"=="" exit /b 1
set i=0
for /f "usebackq delims=" %%l in ("%~1") do (
    set /a i+=1
    set line!i!=%%l
)
for /l %%n in (%i%,-1,1) do echo !line%%n!
endlocal
