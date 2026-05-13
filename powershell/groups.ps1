$identity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$identity.Groups | ForEach-Object {
    try { $_.Translate([System.Security.Principal.NTAccount]).Value } catch { $_.Value }
} | Sort-Object
