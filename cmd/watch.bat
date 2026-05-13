@echo off
setlocal
set interval=2
set cmd=
if "%~1"=="-n" (
    set interval=%~2
    shift
    shift
)
set cmd=%*
:loop
cls
echo Every %interval%s: %cmd%    %date% %time%
echo.
%cmd%
timeout /t %interval% /nobreak >nul
goto :loop
endlocal
