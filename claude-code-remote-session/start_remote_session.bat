@echo off
REM Entry point for ensuring a remote-controllable Claude Code session is
REM alive for this project - see start_remote_session.ps1 (same folder) for
REM the actual logic, and handover_prompt.md for why this exists.
REM Fully portable: copy both files into any project's root, unmodified -
REM the project root is wherever THIS .bat itself is placed.
REM Output is both shown here and appended to start_remote_session.log, so
REM a scheduled (unattended) run's result can still be checked afterwards.
set "SCRIPT=%~dp0start_remote_session.ps1"
set "LOG=%~dp0start_remote_session.log"

powershell -NoProfile -ExecutionPolicy Bypass -Command "& '%SCRIPT%' 2>&1 | Tee-Object -FilePath '%LOG%' -Append"

echo.
echo Output also saved to: %LOG%
echo This window will close automatically in 60 seconds...
REM ping, not timeout - timeout errors out ("Input redirection is not
REM supported") when there's no real console, e.g. run unattended from
REM Task Scheduler; ping's delay works the same either way.
ping -n 61 127.0.0.1 >nul
