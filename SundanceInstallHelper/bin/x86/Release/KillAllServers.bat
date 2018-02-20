net stop "Sundance Watchdog"
net stop "Sundance Storage Server"
net stop "Sundance Media Control Server"

@REM Make sure that the processes are killed, even if they failed to stop when requested.
REM pskill WatchdogSystray.exe
REM pskill MediaControlServer.exe
REM pskill Watchdog.exe
REM pskill StorageServer.exe
