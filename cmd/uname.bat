@echo off
if "%~1"=="-a" (
    for /f "tokens=2 delims=[]" %%v in ('ver') do echo Windows %%v %processor_architecture%
) else if "%~1"=="-r" (
    for /f "tokens=2 delims=[]" %%v in ('ver') do echo %%v
) else if "%~1"=="-m" (
    echo %processor_architecture%
) else if "%~1"=="-n" (
    echo %computername%
) else (
    echo Windows
)
