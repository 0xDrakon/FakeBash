param([string]$Path = ".")
Get-ChildItem $Path | Format-Table Mode, LastWriteTime, Length, Name -AutoSize
