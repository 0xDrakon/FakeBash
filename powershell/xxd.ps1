param([string]$File)
if ($File) { Format-Hex $File } else { $input | Format-Hex }
