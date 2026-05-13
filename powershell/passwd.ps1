param([string]$User = $env:USERNAME)
$secure = Read-Host "New password for $User" -AsSecureString
net user $User (([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($secure))))
