param([string]$Name)
if ($Name) { [System.Environment]::GetEnvironmentVariable($Name) }
else { Get-ChildItem Env: | Sort-Object Name | ForEach-Object { "$($_.Name)=$($_.Value)" } }
