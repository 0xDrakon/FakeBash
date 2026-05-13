param([string]$File, [int]$w = 72)
$lines = if ($File) { Get-Content $File } else { @($input) }
$current = ""
foreach ($line in $lines) {
    foreach ($word in ($line -split '\s+' | Where-Object { $_ })) {
        if ($current -and ($current.Length + 1 + $word.Length) -gt $w) { Write-Output $current; $current = $word }
        elseif ($current) { $current += " $word" } else { $current = $word }
    }
}
if ($current) { Write-Output $current }
