param([string]$File, [switch]$C)
if ($File) { Format-Hex $File } else { $input | Format-Hex }
