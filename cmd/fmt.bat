@echo off
powershell -Command "$w=72; $input | ForEach-Object { $line=''; ($_ -split '\s+') | ForEach-Object { if(($line+$_).Length -gt $w){ Write-Host $line; $line=$_ } else { if($line){ $line+=' '+$_ } else { $line=$_ } } }; if($line){ Write-Host $line } }"
