param([Parameter(Mandatory)][string]$Path, [string]$Suffix)
$base = Split-Path $Path -Leaf
if ($Suffix -and $base.EndsWith($Suffix)) { $base = $base.Substring(0, $base.Length - $Suffix.Length) }
Write-Output $base
