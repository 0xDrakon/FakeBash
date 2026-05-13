$os = Get-CimInstance Win32_OperatingSystem
$uptime = (Get-Date) - $os.LastBootUpTime
Write-Host "$($env:USERNAME)  up $($uptime.Days)d $($uptime.Hours)h:$($uptime.Minutes)m"
Get-Process -IncludeUserName -ErrorAction SilentlyContinue | Where-Object { $_.SessionId -gt 0 } |
    Group-Object UserName | ForEach-Object { Write-Host "$($_.Name): $($_.Count) process(es)" }
