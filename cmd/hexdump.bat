@echo off
if "%~1"=="" exit /b 1
certutil -encodehex "%~1" nul 4 2>nul | findstr /v "^CertUtil"
powershell -Command "Format-Hex '%~1'"
