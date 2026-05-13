@echo off
if "%~1"=="" exit /b 1
for %%f in (%*) do (
    if exist "%%f" (
        echo %%f: %~x1 file
    ) else (
        echo %%f: ERROR cannot open
    )
)
