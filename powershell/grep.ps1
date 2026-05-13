param([Parameter(Mandatory)][string]$Pattern, [Parameter(ValueFromRemainingArguments)][string[]]$Files,
      [switch]$i, [switch]$r, [switch]$l, [switch]$n, [switch]$v, [switch]$c, [switch]$E, [switch]$F)
$ssArgs = @{ Pattern = $Pattern; AllMatches = $true }
if ($i) { $ssArgs['CaseSensitive'] = $false } else { $ssArgs['CaseSensitive'] = $true }
if ($F) { $ssArgs['SimpleMatch'] = $true }
$sources = if ($Files) {
    if ($r) { $Files | ForEach-Object { Get-ChildItem $_ -Recurse -File } | Select-Object -ExpandProperty FullName }
    else { $Files }
} else { @($input) }
$results = $sources | Select-String @ssArgs
if ($v) { 
    $matched = $results | Select-Object -ExpandProperty Line
    $sources | ForEach-Object { Get-Content $_ } | Where-Object { $matched -notcontains $_ }
} elseif ($l) { $results | Select-Object -ExpandProperty Path -Unique }
elseif ($c) { ($results | Group-Object Path | ForEach-Object { "$($_.Name):$($_.Count)" }) }
elseif ($n) { $results | ForEach-Object { "$($_.LineNumber):$($_.Line)" } }
else { $results | Select-Object -ExpandProperty Line }
