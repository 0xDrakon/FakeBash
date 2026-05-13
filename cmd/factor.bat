@echo off
if "%~1"=="" exit /b 1
powershell -Command "$n=%~1; $f=@(); $d=2; while($d*$d -le $n){ while($n%%$d -eq 0){ $f+=$d; $n=[int]($n/$d) } $d++ }; if($n -gt 1){ $f+=$n }; Write-Host '%~1:' ($f -join ' ')"
