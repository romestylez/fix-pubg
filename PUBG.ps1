############################################################################
## Set all the variables here
############################################################################

# Set the path to the Steam installation directory
$steamPath = "C:\Program Files (x86)\Steam"

# Set the name of the game (PUBG)
$gameName = "PUBG: Battlegrounds"

# Set how long the script should wait after launching PUBG before killing the second TslGame.exe
$secondsToKill = 120

############################################################################
## Dont change anything from here
############################################################################


# Check if the script is run with administrative privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "This script requires administrative privileges. Please run it as an administrator." -ForegroundColor Red
    
    # Wait for a key press before closing the script
    $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyUp') | Out-Null
    Exit
}

Write-Host "`n`nScript is running with administrative privileges." -ForegroundColor Green

# Build the full path to the Steam executable (Steam.exe)
$steamExePath = Join-Path -Path $steamPath -ChildPath "Steam.exe"

# Check if Steampath is correct
if (Test-Path $steamExePath) {
    # Start Steam and the game
    Start-Process -FilePath $steamExePath -ArgumentList "-applaunch 578080"

    Write-Host "`n`nLaunching $gameName." -ForegroundColor Green
} else {
    Write-Host "`n`nError: Steam not found in your configured path." -ForegroundColor Red
}

# Display a message before the pause
Write-Host "`nWaiting two minutes before searching and terminating TslGame.exe..." -ForegroundColor Green

# Insert a pause
Start-Sleep -Seconds $secondsToKill

# Display a message after the pause
Write-Host "`nPause completed. Searching and terminating TslGame.exe" -ForegroundColor Green

# Search for all processes with the name "tslgame.exe"
$processes = Get-Process -Name tslgame

# Check if more than one process was found
if ($processes.Count -gt 1) {
    # Select the process with the lowest working set (RAM) usage
    $targetProcess = $processes | Sort-Object WorkingSet -Descending | Select-Object -Last 1

    Write-Host "`nTerminating the process $($targetProcess.ProcessName) (ID: $($targetProcess.Id)) with low working set usage." -ForegroundColor Green

    # Terminate the selected process
    Stop-Process -Id $targetProcess.Id
} elseif ($processes.Count -eq 1) {
    Write-Host "`nOnly one process with the name tslgame.exe was found. Terminating this process." -ForegroundColor Red

    # Terminate the only found process
    Stop-Process -Id $processes.Id
} else {
    Write-Host "`nNo process with the name tslgame.exe found." -ForegroundColor Red
}
Start-Sleep -Seconds 30
Exit
