param([Parameter(Mandatory)][string]$Action, [string]$Service)
switch ($Action) {
    'start'       { Start-Service $Service }
    'stop'        { Stop-Service $Service }
    'restart'     { Restart-Service $Service }
    'status'      { Get-Service $Service | Format-List Name, DisplayName, Status, StartType }
    'enable'      { Set-Service $Service -StartupType Automatic }
    'disable'     { Set-Service $Service -StartupType Disabled }
    'list-units'  { Get-Service | Format-Table Name, DisplayName, Status, StartType -AutoSize }
    default       { Write-Error "Unknown action: $Action" }
}
