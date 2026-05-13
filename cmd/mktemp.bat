@echo off
set tmpfile=%temp%\fakebash_%random%_%random%.tmp
type nul > "%tmpfile%"
echo %tmpfile%
