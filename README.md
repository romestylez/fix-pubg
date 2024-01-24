# fix-pubg
After i saw this tweet -> https://twitter.com/LaubsterMedia/status/1749572275026919557 and the video https://www.youtube.com/watch?v=jd9YLWUgOto from @LaubsterMedia  i wanted to create a Powershell Script to kill the useless TslGame.exe. 

This script will terminate the TslGame.exe with the lowest working set usage. You can choose how long you want to wait until the TslGame.exe will be terminated. Also you can set your Steam installation path.

All credits for finding this going to https://twitter.com/LaubsterMedia

** **You have/can change some variables:** **

** **$steamPath** ** at line 17 to you Steam installation path
** **Start-Sleep -Seconds 120** ** at line 40 can be changed if PUBG is starting slower for you or if you want to terminate the TslGAme.exe later. I have tested it with two minutes and had no problem.
