param([string]$File)
if ($File) { Start-Process notepad $File -Wait } else { Start-Process notepad -Wait }
