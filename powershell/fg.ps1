param([int]$Id)
$job = if ($Id) { Get-Job -Id $Id } else { Get-Job | Sort-Object Id | Select-Object -Last 1 }
if (-not $job) { Write-Error "No background job found"; exit 1 }
Wait-Job $job | Receive-Job
