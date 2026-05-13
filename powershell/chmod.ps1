param([string]$Mode, [Parameter(Mandatory)][string]$Path)
Write-Host "chmod: Windows uses NTFS ACLs, not Unix permission bits."
Write-Host "Use icacls for Windows permissions:"
Write-Host "  icacls `"$Path`" /grant Everyone:F"
Write-Host "  icacls `"$Path`" /grant `"$env:USERNAME`":R"
Write-Host ""
Get-Acl $Path | Format-List Path, Owner, AccessToString
