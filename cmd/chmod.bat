@echo off
echo chmod: Windows does not support Unix file permissions.
echo Use icacls for Windows ACL-based permissions.
echo Example: icacls "%~2" /grant Everyone:F
