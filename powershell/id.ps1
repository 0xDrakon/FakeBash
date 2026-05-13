$identity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$isAdmin  = ([System.Security.Principal.WindowsPrincipal]$identity).IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
Write-Output "User: $($identity.Name)"
Write-Output "IsAdmin: $isAdmin"
Write-Output "Groups: $($identity.Groups | ForEach-Object { $_.Translate([System.Security.Principal.NTAccount]).Value } | Sort-Object)"
