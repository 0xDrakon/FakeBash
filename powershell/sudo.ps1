param([Parameter(Mandatory, ValueFromRemainingArguments)][string[]]$Command)
$cmd = $Command[0]
$cmdArgs = if ($Command.Count -gt 1) { $Command[1..($Command.Count-1)] } else { @() }
Start-Process $cmd -ArgumentList $cmdArgs -Verb RunAs -Wait
