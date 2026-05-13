param([string]$u, [switch]$f, [int]$n = 50, [switch]$e)
$params = @{ MaxEvents = $n; ErrorAction = 'SilentlyContinue' }
if ($u) { $params['ProviderName'] = $u }
$events = Get-WinEvent -LogName System @params | Sort-Object TimeCreated
foreach ($ev in $events) {
    $level = switch ($ev.Level) { 1{'CRITICAL'} 2{'ERROR'} 3{'WARNING'} 4{'INFO'} default{'DEBUG'} }
    Write-Output "$($ev.TimeCreated.ToString('MMM dd HH:mm:ss')) $($env:COMPUTERNAME) $($ev.ProviderName)[$($ev.Id)]: $($ev.Message -replace '\r?\n',' ')"
}
