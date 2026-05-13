@echo off
if "%~1"=="" (
    for /d %%d in (*) do (
        for /f "tokens=3" %%s in ('dir /s /-c "%%d" ^| findstr /c:"File(s)"') do echo %%s	%%d
    )
) else (
    for /f "tokens=3" %%s in ('dir /s /-c "%~1" ^| findstr /c:"File(s)"') do echo %%s	%~1
)
