param([Parameter(Mandatory, ValueFromRemainingArguments)][string[]]$Commands)
foreach ($cmd in $Commands) {
    $found = Get-Command $cmd -ErrorAction SilentlyContinue
    if ($found) { Write-Output $found.Source } else { Write-Error "$cmd: not found" }
}
