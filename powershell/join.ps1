param([Parameter(Mandatory)][string]$File1, [Parameter(Mandatory)][string]$File2, [string]$t = " ")
$a = Get-Content $File1 | ForEach-Object { $p = $_ -split '\s+',2; @{Key=$p[0];Val=$p[1]} }
$b = Get-Content $File2 | ForEach-Object { $p = $_ -split '\s+',2; @{Key=$p[0];Val=$p[1]} }
foreach ($row in $a) { $match = $b | Where-Object { $_.Key -eq $row.Key } | Select-Object -First 1
    if ($match) { "$($row.Key)$t$($row.Val)$t$($match.Val)" } }
