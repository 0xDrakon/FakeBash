param([string]$Name)
if ($Name) { Write-Output ([System.Environment]::GetEnvironmentVariable($Name)) }
else { Get-ChildItem Env: | Sort-Object Name | ForEach-Object { "$($_.Name)=$($_.Value)" } }
