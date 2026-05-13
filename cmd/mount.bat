@echo off
if "%~1"=="" (
    wmic logicaldisk get caption,filesystem,volumename
) else (
    subst %~2 "%~1"
)
