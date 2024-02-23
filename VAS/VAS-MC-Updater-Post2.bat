
Del /Q /F "%localFolder%\%repoName%-%branch%\VAS\VAS-MC-Updater-Pre.bat" >> %LogPath%
REN "%localFolder%\%repoName%-%branch%\VAS\VAS-MC-Updater-Pre2.bat" VAS-MC-Updater-Pre.bat >> %LogPath%

Echo Done
