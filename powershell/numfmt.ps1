param([Parameter(Mandatory)][double]$Number, [switch]$si, [string]$to)
switch ($to) {
    'iec' { if ($Number -ge 1GB) { "{0:0.0}Gi" -f ($Number/1GB) } elseif ($Number -ge 1MB) { "{0:0.0}Mi" -f ($Number/1MB) } elseif ($Number -ge 1KB) { "{0:0.0}Ki" -f ($Number/1KB) } else { $Number } }
    'si'  { if ($Number -ge 1e9) { "{0:0.0}G" -f ($Number/1e9) } elseif ($Number -ge 1e6) { "{0:0.0}M" -f ($Number/1e6) } elseif ($Number -ge 1e3) { "{0:0.0}K" -f ($Number/1e3) } else { $Number } }
    default { "{0:N0}" -f $Number }
}
