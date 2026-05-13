param([Parameter(Mandatory, ValueFromRemainingArguments)][string[]]$Files)
foreach ($f in $Files) {
    $hash = Get-FileHash $f -Algorithm SHA256
    $size = (Get-Item $f).Length
    Write-Output "$($hash.Hash.ToLower()) $size $f"
}
