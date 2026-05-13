param([Parameter(Mandatory)][string]$Set1, [Parameter(Mandatory)][string]$Set2, [string]$File, [switch]$d)
$lines = if ($File) { Get-Content $File } else { @($input) }
foreach ($line in $lines) {
    if ($d) { $line -replace "[$([regex]::Escape($Set1))]", '' }
    else {
        $result = $line
        for ($i = 0; $i -lt [Math]::Min($Set1.Length, $Set2.Length); $i++) {
            $result = $result.Replace($Set1[$i], $Set2[$i])
        }
        $result
    }
}
