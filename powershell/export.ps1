param([Parameter(Mandatory)][string]$Assignment)
$parts = $Assignment -split '=', 2
if ($parts.Count -ne 2) { Write-Error "Usage: export NAME=VALUE"; exit 1 }
[System.Environment]::SetEnvironmentVariable($parts[0], $parts[1], 'User')
Write-Host "Exported $($parts[0]) for current user (open new shell to inherit)"
