param([string]$File)
if ($File) { Get-Content $File | Out-Host -Paging } else { $input | Out-Host -Paging }
