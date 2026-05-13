param([switch]$t, [switch]$u, [switch]$l, [switch]$n, [switch]$p)
$tcp = Get-NetTCPConnection -ErrorAction SilentlyContinue
$udp = Get-NetUDPEndpoint -ErrorAction SilentlyContinue
if (-not $u) {
    $tcp | ForEach-Object {
        $proc = try { (Get-Process $_.OwningProcess -EA SilentlyContinue).Name } catch { "" }
        [PSCustomObject]@{ Proto='tcp'; Local="$($_.LocalAddress):$($_.LocalPort)"; Remote="$($_.RemoteAddress):$($_.RemotePort)"; State=$_.State; Process=$proc }
    } | Format-Table -AutoSize
}
if ($u) {
    $udp | ForEach-Object {
        $proc = try { (Get-Process $_.OwningProcess -EA SilentlyContinue).Name } catch { "" }
        [PSCustomObject]@{ Proto='udp'; Local="$($_.LocalAddress):$($_.LocalPort)"; Process=$proc }
    } | Format-Table -AutoSize
}
