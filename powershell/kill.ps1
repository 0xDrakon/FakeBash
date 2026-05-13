param([Parameter(Mandatory)][string]$Target, [switch]$9, [switch]$SIGKILL)
if ($Target -match '^\d+$') { Stop-Process -Id ([int]$Target) -Force -ErrorAction Stop }
else { Stop-Process -Name $Target -Force -ErrorAction Stop }
