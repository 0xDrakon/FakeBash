param([Parameter(Mandatory)][string]$File, [int]$n = 4)
$bytes = [System.IO.File]::ReadAllBytes($File)
$current = ""
foreach ($b in $bytes) {
    $c = [char]$b
    if ($c -match '[a-zA-Z0-9 !@#$%^&*()_+\-=\[\]{};:\\|,.<>\/?`~]') { $current += $c }
    else { if ($current.Length -ge $n) { Write-Output $current }; $current = "" }
}
if ($current.Length -ge $n) { Write-Output $current }
