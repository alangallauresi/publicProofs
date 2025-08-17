# Auto-commit script for GEOSODIC memory persistence
# Intelligent commit messages based on actual changes

param(
    [string]$Message = $null
)

# Define Git path
$GitPath = "C:\Program Files\Git\cmd\git.exe"

try {
    # Navigate to the repo root
    Set-Location "C:\src\publicProofs"
    
    # Check what's changed
    $statusOutput = & $GitPath status --porcelain
    
    if (-not $statusOutput) {
        Write-Host "No changes to commit" -ForegroundColor Yellow
        return
    }
    
    # Parse changed files
    $addedFiles = @()
    $modifiedFiles = @()
    $deletedFiles = @()
    
    foreach ($line in $statusOutput) {
        $status = $line.Substring(0, 2)
        $file = $line.Substring(3)
        
        if ($status -match "A") { $addedFiles += $file }
        elseif ($status -match "M") { $modifiedFiles += $file }
        elseif ($status -match "D") { $deletedFiles += $file }
        elseif ($status -match "\?\?") { $addedFiles += $file }
    }
    
    # Generate intelligent commit message if not provided
    if (-not $Message) {
        $parts = @()
        
        if ($addedFiles.Count -gt 0) {
            if ($addedFiles.Count -eq 1) {
                $parts += "Add $($addedFiles[0])"
            } else {
                $parts += "Add $($addedFiles.Count) files: $($addedFiles -join ', ')"
            }
        }
        
        if ($modifiedFiles.Count -gt 0) {
            if ($modifiedFiles.Count -eq 1) {
                $parts += "Update $($modifiedFiles[0])"
            } else {
                $parts += "Update $($modifiedFiles.Count) files: $($modifiedFiles -join ', ')"
            }
        }
        
        if ($deletedFiles.Count -gt 0) {
            if ($deletedFiles.Count -eq 1) {
                $parts += "Delete $($deletedFiles[0])"
            } else {
                $parts += "Delete $($deletedFiles.Count) files: $($deletedFiles -join ', ')"
            }
        }
        
        $Message = $parts -join "; "
    }
    
    # Add all changes
    & $GitPath add .
    
    # Commit with descriptive message
    & $GitPath commit -m $Message
    
    # Push to main branch
    & $GitPath push origin main
    
    Write-Host "Successfully committed and pushed changes" -ForegroundColor Green
    Write-Host "Message: $Message" -ForegroundColor Cyan
}
catch {
    Write-Host "Error during commit: $($_.Exception.Message)" -ForegroundColor Red
}
