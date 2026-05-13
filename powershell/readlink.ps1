param([Parameter(Mandatory)][string]$Path)
$item = Get-Item $Path -Force
if ($item.LinkType) { Write-Output $item.Target } else { Resolve-Path $Path | Select-Object -ExpandProperty Path }
