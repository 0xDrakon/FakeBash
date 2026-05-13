param([Parameter(Mandatory)][string]$Service, [Parameter(Mandatory)][string]$Action)
switch ($Action) {
    'start'   { Start-Service $Service }
    'stop'    { Stop-Service $Service }
    'restart' { Restart-Service $Service }
    'status'  { Get-Service $Service | Format-List }
    default   { Write-Error "Unknown action: $Action" }
}
