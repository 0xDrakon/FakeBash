param([Parameter(Mandatory, ValueFromRemainingArguments)][string[]]$Files)
foreach ($f in $Files) {
    $item = Get-Item $f -ErrorAction Stop
    [PSCustomObject]@{
        File     = $item.FullName
        Size     = $item.Length
        Mode     = $item.Mode
        Owner    = (Get-Acl $f).Owner
        Modified = $item.LastWriteTime
        Accessed = $item.LastAccessTime
        Created  = $item.CreationTime
    } | Format-List
}
