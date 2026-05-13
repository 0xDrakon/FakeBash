param([Parameter(Mandatory)][string]$Username, [string]$Comment)
$secure = Read-Host "Password for $Username" -AsSecureString
New-LocalUser -Name $Username -Password $secure -FullName $Comment -ErrorAction Stop
Write-Host "User '$Username' created."
