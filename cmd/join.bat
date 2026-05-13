@echo off
if "%~1"=="" exit /b 1
if "%~2"=="" exit /b 1
powershell -Command "$a=Get-Content '%~1'; $b=Get-Content '%~2'; $a | ForEach-Object { $line=$_; $b | Where-Object { ($_ -split '\s+')[0] -eq ($line -split '\s+')[0] } | ForEach-Object { $line + ' ' + ($_ -replace '^(\S+)\s+','') } }"
