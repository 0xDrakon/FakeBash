param([Parameter(Mandatory, ValueFromRemainingArguments)][string[]]$Paths)
foreach ($p in $Paths) { Resolve-Path $p | Select-Object -ExpandProperty Path }
