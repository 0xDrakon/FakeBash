param([Parameter(Mandatory)][string]$Name, [string]$Type = "A")
Resolve-DnsName $Name -Type $Type | Format-Table Name, Type, TTL, IPAddress, NameHost -AutoSize
