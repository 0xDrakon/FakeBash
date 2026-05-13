@echo off
for /f "tokens=*" %%u in ('whoami') do set user=%%u
echo uid=1000(%user%) gid=1000(%user%) groups=1000(%user%)
