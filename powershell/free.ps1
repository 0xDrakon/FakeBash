param([switch]$h, [switch]$m, [switch]$g)
$os = Get-CimInstance Win32_OperatingSystem
$total = $os.TotalVisibleMemorySize * 1KB
$free  = $os.FreePhysicalMemory * 1KB
$used  = $total - $free
$stf   = Get-CimInstance Win32_PageFileUsage | Measure-Object -Property AllocatedBaseSize -Sum
$swapT = $stf.Sum * 1MB; $swapU = (Get-CimInstance Win32_PageFileUsage | Measure-Object -Property CurrentUsage -Sum).Sum * 1MB
function fmt($b) {
    if ($g) { [Math]::Round($b/1GB,1) } elseif ($m) { [Math]::Round($b/1MB) }
    elseif ($h) { if ($b -ge 1GB) { "{0:0.0}G" -f ($b/1GB) } elseif ($b -ge 1MB) { "{0:0.0}M" -f ($b/1MB) } else { "{0}K" -f [Math]::Round($b/1KB) } }
    else { [Math]::Round($b/1KB) }
}
Write-Host ("{0,-8} {1,12} {2,12} {3,12}" -f "", "total", "used", "free")
Write-Host ("{0,-8} {1,12} {2,12} {3,12}" -f "Mem:", (fmt $total), (fmt $used), (fmt $free))
Write-Host ("{0,-8} {1,12} {2,12} {3,12}" -f "Swap:", (fmt $swapT), (fmt $swapU), (fmt ($swapT - $swapU)))
