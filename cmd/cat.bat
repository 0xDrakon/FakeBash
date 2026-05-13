@echo off
if "%~1"=="" (
    more
) else (
    for %%f in (%*) do type "%%f"
)
