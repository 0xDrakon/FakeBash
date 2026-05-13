param([string]$File, [string]$t = "`t")
$lines = if ($File) { Get-Content $File } else { @($input) }
$lines | ForEach-Object { $_ -split [regex]::Escape($t) } | Format-Table -AutoSize
