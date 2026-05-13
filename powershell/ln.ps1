param([switch]$s, [Parameter(Mandatory)][string]$Target, [Parameter(Mandatory)][string]$LinkName)
$type = if ($s) { 'SymbolicLink' } else { 'HardLink' }
New-Item -ItemType $type -Path $LinkName -Target $Target
