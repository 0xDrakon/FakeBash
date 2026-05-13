param([switch]$a, [switch]$n, [switch]$o, [switch]$ano)
Get-NetTCPConnection | ForEach-Object {
    $proc = if ($_.OwningProcess) { try { (Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue).Name } catch { $_.OwningProcess } } else { "" }
    [PSCustomObject]@{ LocalAddress="$($_.LocalAddress):$($_.LocalPort)"; RemoteAddress="$($_.RemoteAddress):$($_.RemotePort)"; State=$_.State; PID=$_.OwningProcess; Process=$proc }
} | Format-Table -AutoSize
