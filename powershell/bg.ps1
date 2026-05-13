param([Parameter(Mandatory, ValueFromRemainingArguments)][string[]]$Command)
$job = Start-Job -ScriptBlock { param($c,$a) & $c @a } -ArgumentList $Command[0], $Command[1..($Command.Count-1)]
Write-Host "[$($job.Id)] $($job.Name) running in background"
