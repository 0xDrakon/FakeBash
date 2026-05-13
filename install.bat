@echo off
setlocal

echo.
echo  ███████╗ █████╗ ██╗  ██╗███████╗██████╗  █████╗ ███████╗██╗  ██╗
echo  ██╔════╝██╔══██╗██║ ██╔╝██╔════╝██╔══██╗██╔══██╗██╔════╝██║  ██║
echo  █████╗  ███████║█████╔╝ █████╗  ██████╔╝███████║███████╗███████║
echo  ██╔══╝  ██╔══██║██╔═██╗ ██╔══╝  ██╔══██╗██╔══██║╚════██║██╔══██║
echo  ██║     ██║  ██║██║  ██╗███████╗██████╔╝██║  ██║███████║██║  ██║
echo  ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
echo.
echo  Linux commands for Windows — cmd + PowerShell edition
echo  by 0xDrakon (github.com/0xDrakon)
echo  ================================================================
echo.

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo  [ERROR] Administrator privileges required.
    echo  Right-click install.bat and select "Run as administrator".
    echo.
    pause
    exit /b 1
)

set "ROOT=%~dp0"
set "ROOT=%ROOT:~0,-1%"
set "CMD_DIR=%ROOT%\cmd"
set "PS_DIR=%ROOT%\powershell"

if not exist "%CMD_DIR%" (
    echo  [ERROR] cmd folder not found at: %CMD_DIR%
    pause
    exit /b 1
)
if not exist "%PS_DIR%" (
    echo  [ERROR] powershell folder not found at: %PS_DIR%
    pause
    exit /b 1
)

echo  Installing from: %ROOT%
echo.

for /f "skip=2 tokens=3*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path 2^>nul') do set "CURRENT_PATH=%%a %%b"

set "NEW_PATH=%CURRENT_PATH%"
set "CMD_ADDED=0"
set "PS_ADDED=0"

echo %CURRENT_PATH% | findstr /i /c:"%CMD_DIR%" >nul
if %errorlevel%==0 (
    echo  [INFO] cmd\ already in PATH — skipping.
) else (
    set "NEW_PATH=%NEW_PATH%;%CMD_DIR%"
    set "CMD_ADDED=1"
)

echo %CURRENT_PATH% | findstr /i /c:"%PS_DIR%" >nul
if %errorlevel%==0 (
    echo  [INFO] powershell\ already in PATH — skipping.
) else (
    set "NEW_PATH=%NEW_PATH%;%PS_DIR%"
    set "PS_ADDED=1"
)

if %CMD_ADDED%==0 if %PS_ADDED%==0 goto :pathext

setx /M PATH "%NEW_PATH%" >nul
if %errorlevel%==0 (
    if %CMD_ADDED%==1 echo  [OK] Added cmd\ to system PATH.
    if %PS_ADDED%==1  echo  [OK] Added powershell\ to system PATH.
) else (
    echo  [ERROR] Failed to update PATH. Ensure you are running as administrator.
    pause
    exit /b 1
)

:pathext
echo.
echo  Configuring PATHEXT for PowerShell scripts (.PS1)...

for /f "skip=2 tokens=3*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATHEXT 2^>nul') do set "CURRENT_PATHEXT=%%a %%b"

echo %CURRENT_PATHEXT% | findstr /i ".PS1" >nul
if %errorlevel%==0 (
    echo  [INFO] .PS1 already in PATHEXT.
) else (
    setx /M PATHEXT "%CURRENT_PATHEXT%;.PS1" >nul
    if %errorlevel%==0 (
        echo  [OK] Added .PS1 to PATHEXT — PowerShell scripts run without typing the extension.
    ) else (
        echo  [WARN] Could not update PATHEXT. You may need to type grep.ps1 instead of just grep.
    )
)

echo.
echo  Configuring PowerShell execution policy...

powershell -Command "Get-ExecutionPolicy -Scope LocalMachine" 2>nul | findstr /i "Unrestricted\|RemoteSigned\|Bypass" >nul
if %errorlevel%==0 (
    echo  [INFO] Execution policy already allows scripts.
) else (
    powershell -Command "Set-ExecutionPolicy RemoteSigned -Scope LocalMachine -Force" >nul 2>&1
    if %errorlevel%==0 (
        echo  [OK] Set PowerShell execution policy to RemoteSigned.
    ) else (
        echo  [WARN] Could not set execution policy automatically.
        echo         Run this manually in an admin PowerShell:
        echo           Set-ExecutionPolicy RemoteSigned -Scope LocalMachine -Force
    )
)

echo.
echo  Verifying installation...
echo.

set cmdcount=0
for %%f in ("%CMD_DIR%\*.bat") do set /a cmdcount+=1

set pscount=0
for %%f in ("%PS_DIR%\*.ps1") do set /a pscount+=1

echo  cmd commands:        %cmdcount%
echo  PowerShell commands: %pscount%
echo.
echo  ================================================================
echo  [OK] FakeBash installed successfully!
echo  ================================================================
echo.
echo  Open a NEW terminal window for changes to take effect.
echo.
echo  CMD Prompt examples:
echo    ls
echo    grep "error" log.txt
echo    df
echo    ps
echo.
echo  PowerShell examples (type with or without .ps1):
echo    ls
echo    grep "error" log.txt
echo    df -h
echo    free -m
echo    top
echo.
pause
endlocal
