param([string]$File, [string]$t = "o")
if ($File) { Format-Hex $File } else { $input | Format-Hex }
