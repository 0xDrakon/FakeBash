param([string]$File)
$n = 1
$lines = if ($File) { Get-Content $File } else { @($input) }
foreach ($line in $lines) { Write-Output ("{0,6}`t{1}" -f $n, $line); $n++ }
