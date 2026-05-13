@echo off
if "%~1"=="" exit /b 1
powershell -Command "$n=1; Get-Content '%~1' | ForEach-Object { '{0,6}  {1}' -f $n,$_; $n++ }"
