@echo off
:loop
cls
echo =============================== FakeBash top ===============================
echo %date% %time%
echo ============================================================================
tasklist /fo table | sort
timeout /t 3 /nobreak >nul
goto loop
