param([Parameter(Mandatory)][string]$File, [int]$l = 1000, [string]$Prefix = "x")
$lines = Get-Content $File
$part = 0
for ($i = 0; $i -lt $lines.Count; $i += $l) {
    $chunk = $lines[$i..([Math]::Min($i + $l - 1, $lines.Count - 1))]
    $chunk | Set-Content "${Prefix}$('{0:D2}' -f $part).txt"
    $part++
}
