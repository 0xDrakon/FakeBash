param([switch]$aux, [switch]$a, [string]$Name)
if ($Name) { Get-Process -Name $Name | Format-Table Id, CPU, WorkingSet, Name, MainWindowTitle -AutoSize }
else { Get-Process | Format-Table Id, CPU, WorkingSet, Name, MainWindowTitle -AutoSize }
