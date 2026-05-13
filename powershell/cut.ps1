param([string]$d = "`t", [string]$f = "1", [string]$File)
$fieldIdx = ($f -split ',') | ForEach-Object { [int]$_ - 1 }
$lines = if ($File) { Get-Content $File } else { @($input) }
foreach ($line in $lines) {
    $parts = $line -split [regex]::Escape($d)
    ($fieldIdx | ForEach-Object { if ($_ -lt $parts.Count) { $parts[$_] } else { "" } }) -join $d
}
