param([Parameter(Mandatory)][string]$File1, [Parameter(Mandatory)][string]$File2)
$a = Get-Content $File1
$b = Get-Content $File2
$result = Compare-Object $a $b -IncludeEqual
foreach ($r in $result) {
    $prefix = switch ($r.SideIndicator) { '<=' { "< " } '=>' { "> " } '==' { "  " } }
    Write-Output "$prefix$($r.InputObject)"
}
