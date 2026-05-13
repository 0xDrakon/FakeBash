param([string]$File, [int]$n = 10)
if ($File) { Get-Content $File | Select-Object -First $n } else { $input | Select-Object -First $n }
