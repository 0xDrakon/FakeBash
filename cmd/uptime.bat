@echo off
for /f "skip=1 tokens=1" %%t in ('wmic os get LastBootUpTime') do (
    set boot=%%t
    goto :done
)
:done
echo Last boot: %boot:~0,4%-%boot:~4,2%-%boot:~6,2% %boot:~8,2%:%boot:~10,2%:%boot:~12,2%
