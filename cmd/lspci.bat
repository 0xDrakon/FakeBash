@echo off
wmic path win32_pnpentity get name,deviceid /format:list | findstr /i "pci\|ven_\|dev_"
