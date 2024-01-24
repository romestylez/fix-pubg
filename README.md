# fix-pubg
Using this video https://www.youtube.com/watch?v=jd9YLWUgOto from @LaubsterMedia inspired me to create a Powershell Script. 
This script will terminate the TslGame.exe with the lowest working set usage.

All credits for finding this going to https://twitter.com/LaubsterMedia

You have to change "$steamPath" at line 17 to you Steam installation path. Also you can change "Start-Sleep -Seconds 120" at line 40 if PUBG is starting slower for you or if you want to terminate the TslGAme.exe later. I have tested it with two minutes and had no problem.
