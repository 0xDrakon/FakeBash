param([Parameter(Mandatory)][string]$Source, [Parameter(Mandatory)][string]$Destination, [switch]$r)
if ($r) { Copy-Item $Source $Destination -Recurse -Force }
else { Copy-Item $Source $Destination -Force }
