param([string]$File, [int]$n = 10, [switch]$f)
if ($f) { Get-Content $File -Wait | Select-Object -Last $n }
elseif ($File) { Get-Content $File | Select-Object -Last $n }
else { $input | Select-Object -Last $n }
