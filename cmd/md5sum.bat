@echo off
if "%~1"=="" exit /b 1
for %%f in (%*) do (
    for /f "skip=1 tokens=* delims=" %%h in ('certutil -hashfile "%%f" MD5') do (
        echo %%h  %%f
        goto :next
    )
    :next
)
