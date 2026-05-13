param([switch]$l, [switch]$e, [switch]$r)
if ($l) { Get-ScheduledTask | Format-Table TaskName, TaskPath, State -AutoSize }
elseif ($e) { Write-Host "Use 'Register-ScheduledTask' to create tasks in PowerShell."; schtasks /create /? }
elseif ($r) { Write-Warning "This would remove all scheduled tasks. Use Unregister-ScheduledTask." }
else { Get-ScheduledTask | Format-Table TaskName, TaskPath, State -AutoSize }
