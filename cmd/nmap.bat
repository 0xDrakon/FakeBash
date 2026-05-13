@echo off
where nmap >nul 2>&1
if %errorlevel%==0 (
    nmap %*
) else (
    echo nmap not found. Install it from https://nmap.org/download.html
)
