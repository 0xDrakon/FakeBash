param([Parameter(Mandatory)][string]$Command, [Parameter(ValueFromRemainingArguments)][string[]]$Args)
$items = @($input)
foreach ($item in $items) { & $Command @Args $item }
