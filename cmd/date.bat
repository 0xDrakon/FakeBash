@echo off
for /f "tokens=2 delims==" %%d in ('wmic os get LocalDateTime /value') do set dt=%%d
echo %dt:~0,4%-%dt:~4,2%-%dt:~6,2% %dt:~8,2%:%dt:~10,2%:%dt:~12,2%
