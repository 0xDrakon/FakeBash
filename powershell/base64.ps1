param([string]$File, [switch]$d)
if ($d) {
    $data = if ($File) { Get-Content $File -Raw } else { $input -join "" }
    [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($data.Trim()))
} else {
    $bytes = if ($File) { [System.IO.File]::ReadAllBytes((Resolve-Path $File)) }
             else { [System.Text.Encoding]::UTF8.GetBytes(($input -join "`n")) }
    [System.Convert]::ToBase64String($bytes)
}
