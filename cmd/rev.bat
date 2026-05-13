@echo off
setlocal enabledelayedexpansion
if "%~1"=="" (
    set /p line=
    set result=
    set str=!line!
    set len=0
    for /l %%i in (0,1,255) do if "!str:~%%i,1!" neq "" set /a len=%%i+1
    for /l %%i in (!len!,-1,1) do (
        set /a j=%%i-1
        set result=!result!!str:~%j%,1!
    )
    echo !result!
) else (
    for /f "usebackq delims=" %%l in ("%~1") do (
        set str=%%l
        set result=
        set len=0
        for /l %%i in (0,1,255) do if "!str:~%%i,1!" neq "" set /a len=%%i+1
        for /l %%i in (!len!,-1,1) do (
            set /a j=%%i-1
            set result=!result!!str:~%j%,1!
        )
        echo !result!
    )
)
endlocal
