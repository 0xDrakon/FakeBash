param([int]$n = 20, [int]$delay = 3)
while ($true) {
    Clear-Host
    $date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $os = Get-CimInstance Win32_OperatingSystem
    $freeMem = [Math]::Round($os.FreePhysicalMemory / 1024, 1)
    $totalMem = [Math]::Round($os.TotalVisibleMemorySize / 1024, 1)
    Write-Host "top - $date   Mem: ${totalMem}MB total, ${freeMem}MB free" -ForegroundColor Cyan
    Write-Host ("-" * 80)
    Get-Process | Sort-Object CPU -Descending | Select-Object -First $n |
        Format-Table @{L='PID';E={$_.Id}}, @{L='CPU%';E={[Math]::Round($_.CPU,1)}},
            @{L='MEM(MB)';E={[Math]::Round($_.WorkingSet/1MB,1)}}, Name -AutoSize
    Start-Sleep $delay
}
