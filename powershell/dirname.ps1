param([Parameter(Mandatory)][string]$Path)
$parent = Split-Path $Path -Parent
if (-not $parent) { Write-Output "." } else { Write-Output $parent }
