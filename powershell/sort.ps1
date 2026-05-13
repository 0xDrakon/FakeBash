param([string]$File, [switch]$r, [switch]$u, [string]$k, [switch]$n)
$lines = if ($File) { Get-Content $File } else { @($input) }
$sorted = if ($n) { $lines | Sort-Object { [double]$_ } -Descending:$r }
          else { $lines | Sort-Object -Descending:$r }
if ($u) { $sorted | Select-Object -Unique } else { $sorted }
