# fix-pubg
Using this video https://www.youtube.com/watch?v=jd9YLWUgOto from @LaubsterMedia inspired me to create a Powershell Script. 
This script will terminate the TslGame.exe with the lowest working set usage.

All credits for finding this going to https://twitter.com/LaubsterMedia

You have/can change some variables:

"$steamPath" at line 17 to you Steam installation path
"Start-Sleep -Seconds 120" at line 40 can be changed if PUBG is starting slower for you or if you want to terminate the TslGAme.exe later. I have tested it with two minutes and had no problem.
