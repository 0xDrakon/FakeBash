@echo off
setlocal
set width=80
if "%~1"=="-w" set width=%~2
powershell -Command "$w=%width%; $input | ForEach-Object { $l=$_; while($l.Length -gt $w){ Write-Host $l.Substring(0,$w); $l=$l.Substring($w) }; Write-Host $l }"
endlocal
