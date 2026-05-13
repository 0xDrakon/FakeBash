@echo off
wmic diskdrive get model,size,status /format:list
wmic logicaldisk get caption,filesystem,freespace,size /format:list
