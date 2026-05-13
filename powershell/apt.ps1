param([Parameter(Mandatory)][string]$Subcommand, [Parameter(ValueFromRemainingArguments)][string[]]$Packages)
switch ($Subcommand) {
    'install'       { winget install @Packages }
    'remove'        { winget uninstall @Packages }
    'uninstall'     { winget uninstall @Packages }
    'update'        { winget upgrade --all }
    'upgrade'       { winget upgrade --all }
    'search'        { winget search @Packages }
    'list'          { winget list }
    'show'          { winget show @Packages }
    default         { Write-Error "Unknown subcommand: $Subcommand. Use: install, remove, update, search, list, show" }
}
