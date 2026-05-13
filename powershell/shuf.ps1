param([string]$File, [int]$n = [int]::MaxValue)
$lines = if ($File) { Get-Content $File } else { @($input) }
$lines | Get-Random -Count ([Math]::Min($n, $lines.Count))
