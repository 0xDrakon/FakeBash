param([Parameter(Mandatory)][long]$n)
$factors = @(); $d = 2
while ($d * $d -le $n) { while ($n % $d -eq 0) { $factors += $d; $n = [long]($n / $d) }; $d++ }
if ($n -gt 1) { $factors += $n }
Write-Output "$n`: $($factors -join ' ')"
