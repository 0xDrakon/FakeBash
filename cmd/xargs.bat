@echo off
if "%~1"=="" exit /b 1
for /f "delims=" %%l in ('more') do %* "%%l"
