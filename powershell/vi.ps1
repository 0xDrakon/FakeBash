param([string]$File)
$editor = Get-Command vim, nvim, vi -ErrorAction SilentlyContinue | Select-Object -First 1
if ($editor) { & $editor.Name $File } else { Write-Host "vi/vim not found. Opening Notepad."; Start-Process notepad $File -Wait }
