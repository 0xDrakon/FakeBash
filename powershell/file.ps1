param([Parameter(Mandatory, ValueFromRemainingArguments)][string[]]$Files)
foreach ($f in $Files) {
    if (-not (Test-Path $f)) { Write-Output "${f}: cannot open"; continue }
    $item = Get-Item $f
    $ext = $item.Extension.ToLower()
    $type = switch ($ext) {
        '.exe' { 'PE32 executable' } '.dll' { 'PE32 dynamic library' }
        '.txt' { 'ASCII text' } '.ps1' { 'PowerShell script' } '.bat' { 'Windows batch file' }
        '.zip' { 'Zip archive' } '.tar' { 'POSIX tar archive' } '.gz' { 'gzip compressed data' }
        '.jpg' { 'JPEG image data' } '.png' { 'PNG image data' } '.gif' { 'GIF image data' }
        '.pdf' { 'PDF document' } '.json' { 'JSON data' } '.xml' { 'XML document' }
        default { "$ext file" }
    }
    Write-Output "${f}: $type"
}
