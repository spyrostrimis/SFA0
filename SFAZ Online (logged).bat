@echo off
rem Street Fighter Alpha Zero with session logging - use this for online test sessions.
rem Logs (and a zip to send) are saved in save\logs\netlog\  - see external\netlog\README.txt
cd /d "%~dp0"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0external\netlog\launch_logged.ps1" %*
