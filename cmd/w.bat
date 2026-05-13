@echo off
query user 2>nul || net user %username%
