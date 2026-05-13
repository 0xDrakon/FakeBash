param([int]$p)
if ($p) { Get-NetTCPConnection | Where-Object { $_.OwningProcess -eq $p } | Format-Table -AutoSize }
else { Get-NetTCPConnection | Format-Table LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess -AutoSize }
