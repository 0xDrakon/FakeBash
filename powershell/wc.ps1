param([Parameter(ValueFromRemainingArguments)][string[]]$Files, [switch]$l, [switch]$w, [switch]$c)
function Measure-File($content) {
    $lines = ($content | Measure-Object -Line).Lines
    $words = ($content -join " " -split '\s+' | Where-Object { $_ }).Count
    $chars = ($content -join "`n").Length
    [PSCustomObject]@{ Lines = $lines; Words = $words; Chars = $chars }
}
if ($Files) {
    foreach ($f in $Files) {
        $content = Get-Content $f
        $m = Measure-File $content
        if ($l) { Write-Output "$($m.Lines) $f" }
        elseif ($w) { Write-Output "$($m.Words) $f" }
        elseif ($c) { Write-Output "$($m.Chars) $f" }
        else { Write-Output "$($m.Lines) $($m.Words) $($m.Chars) $f" }
    }
} else {
    $content = @($input)
    $m = Measure-File $content
    if ($l) { Write-Output $m.Lines }
    elseif ($w) { Write-Output $m.Words }
    elseif ($c) { Write-Output $m.Chars }
    else { Write-Output "$($m.Lines) $($m.Words) $($m.Chars)" }
}
