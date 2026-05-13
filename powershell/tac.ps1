param([string]$File)
if ($File) { [System.IO.File]::ReadAllLines((Resolve-Path $File)) | Sort-Object { [array]::IndexOf($_, $_) } }
$lines = if ($File) { Get-Content $File } else { @($input) }
[array]::Reverse($lines)
$lines
