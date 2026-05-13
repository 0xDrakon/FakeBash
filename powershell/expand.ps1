param([string]$File, [int]$i = 8)
$spaces = ' ' * $i
$lines = if ($File) { Get-Content $File } else { @($input) }
$lines | ForEach-Object { $_ -replace "`t", $spaces }
