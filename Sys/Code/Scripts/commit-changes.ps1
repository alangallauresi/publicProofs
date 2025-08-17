# Auto-commit script for GEOSODIC memory persistence
# Simple, graceful commits to main branch

param(
    [string]$Message = "Auto-commit: GEOSODIC memory update $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
)

try {
    # Navigate to the repo root
    Set-Location "C:\src\publicProofs"
    
    # Add all changes
    & git add .
    
    # Commit with timestamp
    & git commit -m $Message
    
    # Push to main branch
    & git push origin main
    
    Write-Host "Successfully committed and pushed changes" -ForegroundColor Green
    Write-Host "Message: $Message" -ForegroundColor Cyan
}
catch {
    Write-Host "Error during commit: $($_.Exception.Message)" -ForegroundColor Red
}
