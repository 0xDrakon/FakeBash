param([int]$n = 100)
Get-WinEvent -LogName System -MaxEvents $n -ErrorAction SilentlyContinue |
    Sort-Object TimeCreated |
    ForEach-Object { "[{0}] {1}: {2}" -f $_.TimeCreated.ToString("HH:mm:ss"), $_.LevelDisplayName, $_.Message }
