param([string]$File, [switch]$c, [switch]$d, [switch]$u)
$lines = if ($File) { Get-Content $File } else { @($input) }
$prev = $null; $count = 0; $results = @()
foreach ($line in ($lines + @($null))) {
    if ($line -eq $prev -and $null -ne $prev) { $count++ }
    else {
        if ($null -ne $prev) {
            if ($d -and $count -gt 1) { $results += if ($c) { "$count $prev" } else { $prev } }
            elseif ($u -and $count -eq 1) { $results += if ($c) { "$count $prev" } else { $prev } }
            elseif (-not $d -and -not $u) { $results += if ($c) { "$count $prev" } else { $prev } }
        }
        $prev = $line; $count = 1
    }
}
$results
