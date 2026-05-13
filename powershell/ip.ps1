param([string]$Subcommand = "addr")
switch ($Subcommand) {
    { $_ -in 'addr','a','address' } { Get-NetIPAddress | Format-Table InterfaceAlias, AddressFamily, IPAddress, PrefixLength -AutoSize }
    { $_ -in 'route','r' } { Get-NetRoute | Format-Table DestinationPrefix, NextHop, RouteMetric, InterfaceAlias -AutoSize }
    { $_ -in 'link','l' } { Get-NetAdapter | Format-Table Name, InterfaceDescription, Status, LinkSpeed, MacAddress -AutoSize }
    default { Get-NetIPAddress | Format-Table InterfaceAlias, AddressFamily, IPAddress, PrefixLength -AutoSize }
}
