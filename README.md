
# What is this script doing ?

After i saw [this tweet](https://twitter.com/LaubsterMedia/status/1749572275026919557) and the [video](https://www.youtube.com/watch?v=jd9YLWUgOto) i wanted to create a Powershell Script to kill the useless TslGame.exe. 

This script will terminate the TslGame.exe with the lowest working set usage. You can choose how long you want to wait until the TslGame.exe will be terminated. Also you can set your Steam installation path.

All credits for finding this going to [LaubsterMedia](https://twitter.com/LaubsterMedia)


## Running the Script
1.) Close PUBG

2.) Open WindowsPowershell ISE as admin

3.) Choose "File" -> "Open" and select the Script

4.) Press F5 to start the script


## Variables
The Script is using the following variables which can be changed in the top section of the script.

`$steamPath` path to the Steam installation directory

`$gameName` Set the name of the game (PUBG)

`$secondsToKill` Set how long the script should wait after launching PUBG before killing the second TslGame.exe


## Converting the Script to a .exe
If you changed the variables in the Script you can convert the PowerShell Script into a .exe. To start converting this PowerShell script to EXE, get the PS2EXE tool. To do this use a PowerShell with admin rights and type:

`Install-Module ps2exe`

Then open the GUI:

`win-ps2exe`

Here you have to select the following:
- Compile a graphic windows program (parameter -noConsole)
- Suppress output (-noOutput)
- Require administrator rights at runtime (parameter -requireAdmin)
  
After that click on "Compile" and it will create the standalone EXE. You also can use this command directly from PowerShell ISE without the GUI

`ps2exe -inputFile '<file_name>' -outputFile '<file_name>' -noOutput -requireAdmin`
