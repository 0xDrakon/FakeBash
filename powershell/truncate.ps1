param([Parameter(Mandatory)][string]$File, [long]$s = 0)
if (-not (Test-Path $File)) { New-Item $File -ItemType File | Out-Null }
$stream = [System.IO.File]::Open($File, 'Open', 'Write')
$stream.SetLength($s)
$stream.Close()
