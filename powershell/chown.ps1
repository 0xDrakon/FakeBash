param([Parameter(Mandatory)][string]$Owner, [Parameter(Mandatory)][string]$Path)
Write-Host "chown: Attempting to set owner of '$Path' to '$Owner'..."
$acl = Get-Acl $Path
try {
    $account = New-Object System.Security.Principal.NTAccount($Owner)
    $acl.SetOwner($account)
    Set-Acl $Path $acl
    Write-Host "Owner set to $Owner"
} catch { Write-Error "Failed: $_. Try running as administrator." }
