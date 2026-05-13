param([string]$Path = ".")
Get-ChildItem $Path -Force | Format-Table Mode, LastWriteTime, Length, Name -AutoSize
