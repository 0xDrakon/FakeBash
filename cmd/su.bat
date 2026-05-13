@echo off
if "%~1"=="" (
    runas /user:Administrator cmd
) else (
    runas /user:%~1 cmd
)
