$cpu = Get-CimInstance Win32_Processor
$cpu | ForEach-Object {
    [PSCustomObject]@{
        Name            = $_.Name.Trim()
        Cores           = $_.NumberOfCores
        LogicalCPUs     = $_.NumberOfLogicalProcessors
        MaxClockMHz     = $_.MaxClockSpeed
        Architecture    = $_.Architecture
        Manufacturer    = $_.Manufacturer
    }
} | Format-List
