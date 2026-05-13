$os = Get-CimInstance Win32_OperatingSystem
$uptime = (Get-Date) - $os.LastBootUpTime
Write-Output ("up {0} days, {1:D2}:{2:D2}:{3:D2}" -f $uptime.Days, $uptime.Hours, $uptime.Minutes, $uptime.Seconds)
Write-Output ("Last boot: {0}" -f $os.LastBootUpTime.ToString("yyyy-MM-dd HH:mm:ss"))
