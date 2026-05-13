param([Parameter(Mandatory, ValueFromRemainingArguments)][string[]]$Dirs, [switch]$p)
foreach ($d in $Dirs) { New-Item -ItemType Directory -Path $d -Force:$p | Out-Null }
