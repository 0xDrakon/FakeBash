@echo off
if "%~1"=="" exit /b 1
set url=%~1
set out=%~nx1
if "%~2"=="-O" set out=%~3
if "%~2"=="--output-document" set out=%~3
curl -L -o "%out%" "%url%"
