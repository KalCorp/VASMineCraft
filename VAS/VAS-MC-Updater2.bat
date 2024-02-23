@echo off

Set LogPath="%INST_MC_DIR%\VAS\VAS-MC.Log"

Echo Test bat started > %LogPath%
echo.
Echo INST_NAME:  %INST_NAME%>> %LogPath%
echo INST_ID - ID: %INST_ID%>> %LogPath%
echo INST_DIR: %INST_DIR%>> %LogPath%
echo INST_MC_DIR: %INST_MC_DIR%>> %LogPath%
echo INST_JAVA: %INST_JAVA%>> %LogPath%
echo INST_JAVA_ARGS: %INST_JAVA_ARGS%>> %LogPath%
echo .


set "repoOwner=KalCorp"  REM Replace with the owner of the repository
set "repoName=VASMineCraft"  REM Replace with the name of the repository
set "branch=VAS-MC-1.20.1-Forge"  REM Replace with the branch you want to download from
set "localFolder=%INST_MC_DIR%\VAS"

set "zipUrl=https://github.com/%repoOwner%/%repoName%/archive/%branch%.zip"

REM Download the ZIP file
curl -L -o "%localFolder%\%repoName%-%branch%.zip" "%zipUrl%" >> %LogPath%

del /Q /S "%localFolder%\%repoName%-%branch%"

REM Unzip the contents to the specified folder
powershell -command "& {Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('%localFolder%\%repoName%-%branch%.zip', '%localFolder%');}" >> %LogPath%

RoboCopy "%localFolder%\%repoName%-%branch%" "%INST_MC_DIR%" *.* /S /XD mods >> %LogPath%
RoboCopy "%localFolder%\%repoName%-%branch%\mods" "%INST_MC_DIR%\mods" *.* /MIR /S >> %LogPath%

Echo Done



