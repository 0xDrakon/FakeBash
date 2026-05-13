param([Parameter(ValueFromRemainingArguments)][string[]]$Command)
if ($Command) {
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    & $Command[0] @($Command[1..($Command.Count-1)])
    $sw.Stop()
    Write-Host "`nreal`t$($sw.Elapsed.ToString('m\mss\.fff\s'))" -ForegroundColor Yellow
} else { Get-Date -Format "HH:mm:ss" }
