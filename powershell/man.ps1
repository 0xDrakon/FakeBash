param([Parameter(Mandatory)][string]$Command)
$help = Get-Help $Command -ErrorAction SilentlyContinue
if ($help) { Get-Help $Command -Full | Out-Host -Paging }
else { Write-Host "No help for '$Command'. Try: Get-Help $Command" }
