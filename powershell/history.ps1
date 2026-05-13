param([int]$n)
if ($n) { Get-History -Count $n } else { Get-History }
