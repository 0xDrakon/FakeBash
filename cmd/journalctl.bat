@echo off
if "%~1"=="-u" (
    wevtutil qe System /q:"*[System[Provider[@Name='%~2']]]" /c:50 /rd:true /f:text
) else if "%~1"=="-f" (
    wevtutil qe System /c:50 /rd:true /f:text
) else (
    wevtutil qe System /c:50 /rd:true /f:text
)
