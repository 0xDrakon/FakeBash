param([Parameter(Mandatory)][string]$Drive)
subst ($Drive.TrimEnd(':') + ':') /d
