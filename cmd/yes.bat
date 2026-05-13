@echo off
set word=y
if not "%~1"=="" set word=%~1
:loop
echo %word%
goto :loop
