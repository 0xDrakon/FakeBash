param([string]$Source, [string]$Target)
if ($Source -and $Target) { subst $Target $Source; Write-Host "Mounted $Source as $Target" }
else { Get-PSDrive -PSProvider FileSystem | Format-Table Name, Root, Used, Free -AutoSize }
