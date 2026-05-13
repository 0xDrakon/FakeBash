param([Parameter(ValueFromRemainingArguments)][string[]]$Files)
if ($Files) { foreach ($f in $Files) { Get-Content $f } } else { $input }
