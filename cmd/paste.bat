@echo off
if "%~1"=="" exit /b 1
if "%~2"=="" exit /b 1
powershell -Command "$a=Get-Content '%~1'; $b=Get-Content '%~2'; for($i=0;$i -lt [Math]::Max($a.Count,$b.Count);$i++){ '{0}`t{1}' -f $a[$i],$b[$i] }"
