param([Parameter(ValueFromRemainingArguments)][string[]]$Args)
$nm = Get-Command nmap -ErrorAction SilentlyContinue
if ($nm) { nmap @Args }
else { Write-Error "nmap not found. Install from https://nmap.org/download.html or via: winget install nmap" }
