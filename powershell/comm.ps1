param([Parameter(Mandatory)][string]$File1, [Parameter(Mandatory)][string]$File2)
$a = Get-Content $File1 | Sort-Object
$b = Get-Content $File2 | Sort-Object
$onlyA = $a | Where-Object { $b -notcontains $_ }
$onlyB = $b | Where-Object { $a -notcontains $_ }
$both  = $a | Where-Object { $b -contains $_ }
$onlyA | ForEach-Object { Write-Output $_ }
$onlyB | ForEach-Object { Write-Output "`t$_" }
$both  | ForEach-Object { Write-Output "`t`t$_" }
