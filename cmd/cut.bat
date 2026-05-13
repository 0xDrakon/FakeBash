@echo off
setlocal enabledelayedexpansion
set delim=	
set fields=1
if "%~1"=="-d" (
    set delim=%~2
    if "%~3"=="-f" set fields=%~4
) else if "%~1"=="-f" (
    set fields=%~2
)
for /f "delims=" %%l in ('more') do (
    set line=%%l
    set /a col=0
    for %%t in ("!line:%delim%=" "!") do (
        set /a col+=1
        if !col!==!fields! echo %%~t
    )
)
endlocal
