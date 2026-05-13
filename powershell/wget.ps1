param([Parameter(Mandatory)][string]$Uri, [string]$O, [string]$OutFile)
$dest = if ($O) { $O } elseif ($OutFile) { $OutFile } else { Split-Path $Uri -Leaf }
Write-Host "Downloading $Uri --> $dest"
Invoke-WebRequest $Uri -OutFile $dest -UseBasicParsing
Write-Host "Saved to $dest"
