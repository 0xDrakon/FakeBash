param([Parameter(Mandatory)][string]$Source, [Parameter(Mandatory)][string]$Destination,
      [switch]$a, [switch]$v, [switch]$r, [switch]$n, [switch]$delete)
$rsync = Get-Command rsync -ErrorAction SilentlyContinue
if ($rsync) { & rsync @args } else {
    Write-Host "rsync not found — using robocopy"
    $flags = @('/E')
    if ($v) { $flags += '/V' }
    if ($n) { $flags += '/L' }
    if ($delete) { $flags += '/PURGE' }
    robocopy $Source $Destination @flags
}
