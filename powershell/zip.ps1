param([Parameter(Mandatory)][string]$Destination, [Parameter(Mandatory)][string]$Source)
Compress-Archive -Path $Source -DestinationPath $Destination -Force
Write-Host "Created $Destination"
