param([Parameter(Mandatory)][string]$Command, [Parameter(ValueFromRemainingArguments)][string[]]$Args, [int]$n = 2)
while ($true) {
    Clear-Host
    Write-Host "Every ${n}s: $Command $Args    $(Get-Date -Format 'HH:mm:ss')" -ForegroundColor Cyan
    Write-Host ("-" * 60)
    & $Command @Args
    Start-Sleep $n
}
