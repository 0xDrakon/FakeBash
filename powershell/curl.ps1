param([Parameter(Mandatory)][string]$Uri, [string]$X = "GET", [string]$d, [hashtable]$H,
      [string]$o, [switch]$s, [switch]$L, [switch]$I)
$params = @{ Uri = $Uri; Method = $X; UseBasicParsing = $true }
if ($d) { $params['Body'] = $d }
if ($H) { $params['Headers'] = $H }
if ($I) { $params['Method'] = 'HEAD' }
$response = Invoke-WebRequest @params
if ($o) { $response.Content | Set-Content $o }
elseif ($I) { $response.Headers.GetEnumerator() | ForEach-Object { "$($_.Key): $($_.Value)" } }
elseif (-not $s) { $response.Content }
