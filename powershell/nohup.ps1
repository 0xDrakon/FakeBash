param([Parameter(Mandatory, ValueFromRemainingArguments)][string[]]$Command)
Start-Job -ScriptBlock { param($c, $a) & $c @a *>> nohup.out } -ArgumentList $Command[0], $Command[1..($Command.Count-1)] | Out-Null
Write-Host "Process running in background. Output appended to nohup.out"
