param([switch]$h)
$drives = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Root }
Write-Host ("{0,-12} {1,12} {2,12} {3,12} {4,6} {5}" -f "Filesystem","Size","Used","Available","Use%","Mounted on")
foreach ($d in $drives) {
    if ($d.Used -ne $null -and $d.Free -ne $null) {
        $total = $d.Used + $d.Free
        $pct = if ($total -gt 0) { [Math]::Round($d.Used / $total * 100) } else { 0 }
        if ($h) {
            function fmtH($b) { if ($b -ge 1GB) { "{0:0.0}G" -f ($b/1GB) } elseif ($b -ge 1MB) { "{0:0.0}M" -f ($b/1MB) } else { "{0}K" -f [Math]::Round($b/1KB) } }
            Write-Host ("{0,-12} {1,12} {2,12} {3,12} {4,5}% {5}" -f $d.Name, (fmtH $total), (fmtH $d.Used), (fmtH $d.Free), $pct, $d.Root)
        } else {
            Write-Host ("{0,-12} {1,12} {2,12} {3,12} {4,5}% {5}" -f $d.Name, $total, $d.Used, $d.Free, $pct, $d.Root)
        }
    }
}
