Get-NetIPConfiguration | ForEach-Object {
    Write-Host "$($_.InterfaceAlias):" -ForegroundColor Cyan
    Write-Host "  IPv4: $($_.IPv4Address.IPAddress)"
    Write-Host "  IPv6: $($_.IPv6Address.IPAddress)"
    Write-Host "  GW:   $($_.IPv4DefaultGateway.NextHop)"
    Write-Host "  DNS:  $($_.DNSServer.ServerAddresses -join ', ')"
    Write-Host ""
}
