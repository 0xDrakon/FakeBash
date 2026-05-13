@echo off
wmic cpu get name,numberofcores,numberoflogicalprocessors,maxclockspeed /format:list
