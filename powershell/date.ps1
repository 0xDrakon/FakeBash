param([string]$Format)
if ($Format) {
    $fmt = $Format -replace '^+','' -replace '%Y','yyyy' -replace '%m','MM' -replace '%d','dd' -replace '%H','HH' -replace '%M','mm' -replace '%S','ss' -replace '%A','dddd' -replace '%a','ddd'
    Get-Date -Format $fmt
} else { Get-Date -Format "ddd MMM dd HH:mm:ss zzz yyyy" }
