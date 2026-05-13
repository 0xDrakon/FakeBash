param([switch]$groups, [switch]$priv, [switch]$all)
if ($all) { whoami /all } elseif ($groups) { whoami /groups } elseif ($priv) { whoami /priv }
else { Write-Output "$env:USERDOMAIN\$env:USERNAME" }
