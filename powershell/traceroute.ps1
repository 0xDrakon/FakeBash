param([Parameter(Mandatory)][string]$Host)
Test-NetConnection $Host -TraceRoute | Select-Object -ExpandProperty TraceRoute | ForEach-Object -Begin { $n=1 } -Process { Write-Host "$n  $_"; $n++ }
