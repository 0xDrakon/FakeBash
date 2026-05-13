@echo off
where vim >nul 2>&1
if %errorlevel%==0 (
    vim %*
) else (
    where nvim >nul 2>&1
    if %errorlevel%==0 (
        nvim %*
    ) else (
        echo vim not found. Falling back to notepad.
        notepad %*
    )
)
