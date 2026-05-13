param([string]$Name, [string]$Value)
if ($Name -and $Value) { Set-Alias -Name $Name -Value $Value -Scope Global }
elseif ($Name) { Get-Alias $Name }
else { Get-Alias | Sort-Object Name | Format-Table Name, Definition -AutoSize }
