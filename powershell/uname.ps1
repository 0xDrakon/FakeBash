param([switch]$a, [switch]$r, [switch]$m, [switch]$n, [switch]$s, [switch]$v)
$os = Get-CimInstance Win32_OperatingSystem
$cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
if ($a) { Write-Output "Windows $($os.Version) $($env:COMPUTERNAME) $($os.BuildNumber) $($cpu.Architecture)" }
elseif ($r) { Write-Output $os.Version }
elseif ($m) { Write-Output $cpu.Architecture }
elseif ($n) { Write-Output $env:COMPUTERNAME }
elseif ($v) { Write-Output $os.BuildNumber }
else { Write-Output "Windows" }
