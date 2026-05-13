param([Parameter(Mandatory)][string]$File1, [Parameter(Mandatory)][string]$File2, [string]$d = "`t")
$a = Get-Content $File1; $b = Get-Content $File2
$max = [Math]::Max($a.Count, $b.Count)
for ($i = 0; $i -lt $max; $i++) { "$($a[$i])$d$($b[$i])" }
