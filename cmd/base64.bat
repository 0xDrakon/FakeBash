@echo off
if "%~1"=="-d" (
    powershell -Command "[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String([System.IO.File]::ReadAllText('%~2').Trim()))"
) else if not "%~1"=="" (
    powershell -Command "[Convert]::ToBase64String([System.IO.File]::ReadAllBytes('%~1'))"
) else (
    powershell -Command "$in = $input -join ''; [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($in))"
)
