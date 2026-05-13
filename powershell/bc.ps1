param([string]$Expr)
if ($Expr) { Invoke-Expression $Expr }
else {
    Write-Host "FakeBash bc — type expressions, 'quit' to exit"
    while ($true) {
        $line = Read-Host "bc"
        if ($line -match '^(quit|exit|q)$') { break }
        try { Invoke-Expression $line } catch { Write-Host "Error: $_" }
    }
}
