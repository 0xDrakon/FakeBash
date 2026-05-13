param([switch]$a)
Get-NetNeighbor | Format-Table InterfaceAlias, IPAddress, LinkLayerAddress, State -AutoSize
