param([Parameter(Mandatory)][string]$File1, [Parameter(Mandatory)][string]$File2)
$a = Get-FileHash $File1 -Algorithm SHA256
$b = Get-FileHash $File2 -Algorithm SHA256
if ($a.Hash -eq $b.Hash) { Write-Output "Files are identical." }
else {
    $bytes1 = [System.IO.File]::ReadAllBytes($File1)
    $bytes2 = [System.IO.File]::ReadAllBytes($File2)
    for ($i = 0; $i -lt [Math]::Min($bytes1.Length, $bytes2.Length); $i++) {
        if ($bytes1[$i] -ne $bytes2[$i]) {
            Write-Output "$File1 $File2 differ: byte $($i+1), line $(($i / 80)+1)"
            break
        }
    }
}
