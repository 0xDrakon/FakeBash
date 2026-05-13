param([Parameter(Mandatory)][string]$File, [string]$d = ".")
Expand-Archive -Path $File -DestinationPath $d -Force
Write-Host "Extracted to $d"
