Get-NetAdapter -Physical | Where-Object { $_.MediaType -match 'Native 802.11|WiFi|Wireless' } | ForEach-Object {
    $stats = Get-NetAdapterStatistics $_.Name -ErrorAction SilentlyContinue
    Write-Host "$($_.Name):" -ForegroundColor Cyan
    Write-Host "  Status:    $($_.Status)"
    Write-Host "  LinkSpeed: $($_.LinkSpeed)"
    Write-Host "  MAC:       $($_.MacAddress)"
}
