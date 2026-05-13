$disks = Get-CimInstance Win32_DiskDrive
foreach ($disk in $disks) {
    Write-Host ("[DISK] $($disk.Model) — $([Math]::Round($disk.Size/1GB,1)) GB") -ForegroundColor Cyan
    $partitions = Get-CimAssociatedInstance $disk -ResultClassName Win32_DiskPartition
    foreach ($part in $partitions) {
        Write-Host ("  [PART] $($part.Name) — $([Math]::Round($part.Size/1GB,1)) GB")
        $logicals = Get-CimAssociatedInstance $part -ResultClassName Win32_LogicalDisk
        foreach ($lv in $logicals) {
            Write-Host ("    [DRIVE] $($lv.DeviceID)  FS=$($lv.FileSystem)  Free=$([Math]::Round($lv.FreeSpace/1GB,1))GB")
        }
    }
}
