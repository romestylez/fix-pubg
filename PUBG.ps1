# Check if the script is run with administrative privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "This script requires administrative privileges. Please run it as an administrator." -ForegroundColor Red
    
    # Wait for a key press before closing the script
    $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyUp') | Out-Null
    Exit
}

write-host "`n"
write-host "`n"
Write-Host "Script is running with administrative privileges." -ForegroundColor Green
write-host "`n"
write-host "`n"

# Set the path to the Steam installation directory
$steamPath = "D:\Steam"

# Set the name of the game (PUBG)
$gameName = "PUBG: Battlegrounds"

# Build the full path to the Steam executable (Steam.exe)
$steamExePath = Join-Path -Path $steamPath -ChildPath "Steam.exe"

# Check if Steam exists
if (Test-Path $steamExePath) {
    # Start Steam and the game
    Start-Process -FilePath $steamExePath -ArgumentList "-applaunch 578080"

    Write-Host "Launching $gameName." -ForegroundColor Green
} else {
    Write-Host "Error: Steam not found." -ForegroundColor Red
}
write-host "`n"
write-host "`n"
# Display a message before the pause
Write-Host "Waiting two minutes before searching and terminating TslGame.exe..." -ForegroundColor Green

# Insert a 2-minute pause
Start-Sleep -Seconds 120

# Display a message after the pause
Write-Host "Pause completed. Searching and terminating TslGame.exe" -ForegroundColor Green

# Search for all processes with the name "tslgame.exe"
$processes = Get-Process -Name tslgame

# Check if more than one process was found
if ($processes.Count -gt 1) {
    # Select the process with the lowest working set (RAM) usage
    $targetProcess = $processes | Sort-Object WorkingSet | Select-Object -Last 1

    Write-Host "Terminating the process $($targetProcess.ProcessName) (ID: $($targetProcess.Id)) with low working set usage." -ForegroundColor Green

    # Terminate the selected process
    Stop-Process -Id $targetProcess.Id
} elseif ($processes.Count -eq 1) {
    Write-Host "Only one process with the name tslgame.exe was found. Terminating this process." -ForegroundColor Red

    # Terminate the only found process
    Stop-Process -Id $processes.Id
} else {
    Write-Host "No process with the name tslgame.exe found." -ForegroundColor Red
}
Pause