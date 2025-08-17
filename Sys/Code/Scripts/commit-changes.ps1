# Auto-commit script for GEOSODIC memory persistence
# Simple, graceful commits to main branch

param(
    [string]$Message = "Auto-commit: GEOSODIC memory update $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
)

# Define Git path
$GitPath = "C:\Program Files\Git\cmd\git.exe"

try {
    # Navigate to the repo root
    Set-Location "C:\src\publicProofs"
    
    # Add all changes
    & $GitPath add .
    
    # Commit with timestamp
    & $GitPath commit -m $Message
    
    # Push to main branch
    & $GitPath push origin main
    
    Write-Host "Successfully committed and pushed changes" -ForegroundColor Green
    Write-Host "Message: $Message" -ForegroundColor Cyan
}
catch {
    Write-Host "Error during commit: $($_.Exception.Message)" -ForegroundColor Red
}
