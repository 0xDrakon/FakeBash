@echo off
if "%~1"=="" exit /b 1
if "%~2"=="" exit /b 1
powershell -Command "$a=Get-Content '%~1'; $b=Get-Content '%~2'; $only1=$a | Where-Object { $b -notcontains $_ }; $only2=$b | Where-Object { $a -notcontains $_ }; $both=$a | Where-Object { $b -contains $_ }; $only1|%{''+$_}; $only2|%{'`t'+$_}; $both|%{'`t`t'+$_}"
