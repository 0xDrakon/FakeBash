@echo off
if "%~1"=="" exit /b 1
set file=%~1
(
    for /f "delims=" %%l in ('more') do (
        echo %%l
        echo %%l>> "%file%"
    )
)
