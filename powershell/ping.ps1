param([Parameter(Mandatory)][string]$Host, [int]$c = 4, [switch]$t)
if ($t) { while ($true) { Test-Connection $Host -Count 1 | ForEach-Object { Write-Host "Reply from $($_.Address): time=$($_.Latency)ms" }; Start-Sleep 1 } }
else { Test-Connection $Host -Count $c | ForEach-Object { Write-Host "Reply from $($_.Address): time=$($_.Latency)ms" } }
