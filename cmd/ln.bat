@echo off
if "%~1"=="" exit /b 1
if "%~2"=="" exit /b 1
if "%~1"=="-s" (
    mklink "%~3" "%~2"
) else (
    mklink /h "%~2" "%~1"
)
