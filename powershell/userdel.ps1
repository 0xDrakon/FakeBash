param([Parameter(Mandatory)][string]$Username)
Remove-LocalUser -Name $Username -ErrorAction Stop
Write-Host "User '$Username' removed."
