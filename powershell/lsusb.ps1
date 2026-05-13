Get-PnpDevice -Class USB -ErrorAction SilentlyContinue | Where-Object { $_.Status -eq 'OK' } |
    Select-Object FriendlyName, InstanceId, Status | Format-Table -AutoSize
