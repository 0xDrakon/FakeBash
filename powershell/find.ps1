param([string]$Path = ".", [string]$name, [string]$type)
$gci = @{ Path = $Path; Recurse = $true; ErrorAction = 'SilentlyContinue' }
if ($name) { $gci['Filter'] = $name }
if ($type -eq 'f') { Get-ChildItem @gci | Where-Object { -not $_.PSIsContainer } | Select-Object -ExpandProperty FullName }
elseif ($type -eq 'd') { Get-ChildItem @gci | Where-Object { $_.PSIsContainer } | Select-Object -ExpandProperty FullName }
else { Get-ChildItem @gci | Select-Object -ExpandProperty FullName }
