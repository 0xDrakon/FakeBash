param([Parameter(Mandatory, ValueFromRemainingArguments)][string[]]$Paths, [switch]$r, [switch]$f, [switch]$rf, [switch]$fr)
$recurse = $r -or $rf -or $fr
$force = $f -or $rf -or $fr
foreach ($p in $Paths) { Remove-Item $p -Recurse:$recurse -Force:$force -ErrorAction $(if ($force) { 'SilentlyContinue' } else { 'Stop' }) }
