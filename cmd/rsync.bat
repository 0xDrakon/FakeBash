@echo off
where rsync >nul 2>&1
if %errorlevel%==0 (
    rsync %*
) else (
    echo rsync not found. Install via: winget install WinSCP.WinSCP
    echo Alternatively use robocopy for local sync: robocopy %*
)
