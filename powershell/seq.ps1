param([Parameter(Mandatory)][double]$First, [double]$Second, [double]$Last)
if ($PSBoundParameters.ContainsKey('Last')) { $First..$Last | Where-Object { ($_ - $First) % $Second -eq 0 } | ForEach-Object { $_ } }
elseif ($PSBoundParameters.ContainsKey('Second')) { $First..$Second }
else { 1..[int]$First }
