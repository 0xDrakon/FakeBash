param([string]$User = "Administrator")
Start-Process powershell -ArgumentList "-NoExit", "-Command", "Write-Host 'Running as $User'" -Verb RunAs
