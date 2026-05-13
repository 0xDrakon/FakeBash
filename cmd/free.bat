@echo off
for /f "skip=1 tokens=2" %%m in ('wmic os get TotalVisibleMemorySize') do set total=%%m
for /f "skip=1 tokens=2" %%m in ('wmic os get FreePhysicalMemory') do set free=%%m
set /a used=%total%-%free%
echo               total        used        free
echo Mem:     %total% KB   %used% KB   %free% KB
