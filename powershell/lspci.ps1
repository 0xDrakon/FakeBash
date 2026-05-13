Get-PnpDevice -ErrorAction SilentlyContinue | Where-Object { $_.InstanceId -like 'PCI*' } |
    Select-Object FriendlyName, InstanceId, Status | Format-Table -AutoSize
