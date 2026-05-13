@echo off
if "%~1"=="" exit /b 1
for %%f in ("%~1") do echo %%~ff
