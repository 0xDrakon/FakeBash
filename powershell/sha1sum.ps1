param([Parameter(Mandatory, ValueFromRemainingArguments)][string[]]$Files)
foreach ($f in $Files) {
    $hash = Get-FileHash $f -Algorithm SHA1
    Write-Output "$($hash.Hash.ToLower())  $f"
}
