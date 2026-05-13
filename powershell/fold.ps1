param([string]$File, [int]$w = 80)
$lines = if ($File) { Get-Content $File } else { @($input) }
foreach ($line in $lines) {
    $pos = 0
    while ($pos -lt $line.Length) { Write-Output $line.Substring($pos, [Math]::Min($w, $line.Length - $pos)); $pos += $w }
}
