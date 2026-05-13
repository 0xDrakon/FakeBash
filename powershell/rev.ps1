param([string]$File)
$lines = if ($File) { Get-Content $File } else { @($input) }
foreach ($line in $lines) { $chars = $line.ToCharArray(); [array]::Reverse($chars); -join $chars }
