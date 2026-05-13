param([Parameter(Mandatory, ValueFromRemainingArguments)][string[]]$Files)
foreach ($f in $Files) {
    if (Test-Path $f) { (Get-Item $f).LastWriteTime = Get-Date }
    else { New-Item -ItemType File -Path $f -Force | Out-Null }
}
