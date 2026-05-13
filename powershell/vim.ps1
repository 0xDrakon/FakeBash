param([string]$File)
$editor = Get-Command vim, nvim -ErrorAction SilentlyContinue | Select-Object -First 1
if ($editor) { & $editor.Name $File } else { Write-Host "vim not found. Opening Notepad."; Start-Process notepad $File -Wait }
