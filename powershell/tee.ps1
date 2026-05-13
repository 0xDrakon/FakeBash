param([Parameter(Mandatory)][string]$File, [switch]$a)
$lines = @($input)
if ($a) { $lines | Add-Content $File } else { $lines | Set-Content $File }
$lines
