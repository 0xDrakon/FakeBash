param([string]$Path = ".", [switch]$s, [switch]$h)
function fmtH($b) { if ($b -ge 1GB) { "{0:0.0}G" -f ($b/1GB) } elseif ($b -ge 1MB) { "{0:0.0}M" -f ($b/1MB) } elseif ($b -ge 1KB) { "{0:0.0}K" -f ($b/1KB) } else { "$b" } }
if ($s) {
    $size = (Get-ChildItem $Path -Recurse -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
    $disp = if ($h) { fmtH $size } else { [Math]::Round($size/1KB) }
    Write-Output "$disp`t$Path"
} else {
    Get-ChildItem $Path -Directory | ForEach-Object {
        $size = (Get-ChildItem $_.FullName -Recurse -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
        $disp = if ($h) { fmtH $size } else { [Math]::Round($size/1KB) }
        Write-Output "$disp`t$($_.Name)"
    }
}
