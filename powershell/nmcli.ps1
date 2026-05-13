param([string]$Object = "dev", [string]$Action)
switch ($Object) {
    { $_ -in 'dev','device' } { Get-NetAdapter | Format-Table Name, InterfaceDescription, Status, LinkSpeed -AutoSize }
    { $_ -in 'con','connection' } { Get-NetConnectionProfile | Format-Table Name, InterfaceAlias, NetworkCategory -AutoSize }
    { $_ -in 'wifi' } { netsh wlan show networks mode=bssid }
    default { Get-NetAdapter | Format-Table -AutoSize }
}
