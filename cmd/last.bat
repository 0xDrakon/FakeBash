@echo off
wevtutil qe Security /q:"*[System[(EventID=4624)]]" /c:20 /rd:true /f:text | findstr /i "account name\|logon type\|date"
