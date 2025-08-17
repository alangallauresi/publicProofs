# Auto-commit script for GEOSODIC memory persistence
# MCP-compatible by default, with options to override

param(
    [string]$Message = $null,
    [switch]$ConsoleMode = $false,  # Set to true for direct console with colors
    [switch]$Verbose = $false       # Extra output for debugging
)

# Define Git path
$GitPath = "C:\Program Files\Git\cmd\git.exe"

# Default to MCP-compatible mode unless explicitly told otherwise
$MCPMode = -not $ConsoleMode

# MCP-compatible output function
function Write-Output-Safe {
    param([string]$Text, [string]$Level = "INFO")
    
    if ($MCPMode) {
        # MCP tools handle plain text better than Write-Host with colors
        Write-Output "[$Level] $Text"
    } else {
        # Standard PowerShell with colors for direct console use
        $color = switch ($Level) {
            "SUCCESS" { "Green" }
            "WARNING" { "Yellow" }
            "ERROR" { "Red" }
            "INFO" { "Cyan" }
            default { "White" }
        }
        Write-Host $Text -ForegroundColor $color
    }
}

try {
    # Navigate to the repo root
    Set-Location "C:\src\publicProofs"
    
    if ($Verbose) { Write-Output-Safe "Checking git status in $(Get-Location)" "INFO" }
    
    # Check what's changed - capture output properly for MCP
    $statusOutput = & $GitPath status --porcelain 2>&1
    
    if ($Verbose) { Write-Output-Safe "Git status output: '$statusOutput'" "INFO" }
    
    if (-not $statusOutput -or $statusOutput.Count -eq 0) {
        Write-Output-Safe "No changes to commit" "WARNING"
        return
    }
    
    # Parse changed files
    $addedFiles = @()
    $modifiedFiles = @()
    $deletedFiles = @()
    
    foreach ($line in $statusOutput) {
        if ($line.Length -lt 3) { continue }  # Skip empty or malformed lines
        
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
    
    if ($Verbose) { Write-Output-Safe "Generated message: '$Message'" "INFO" }
    
    # Add all changes - capture output for MCP compatibility
    $addOutput = & $GitPath add . 2>&1
    if ($Verbose -and $addOutput) { Write-Output-Safe "Git add output: $addOutput" "INFO" }
    
    # Commit with descriptive message - capture output
    $commitOutput = & $GitPath commit -m $Message 2>&1
    if ($MCPMode) {
        # In MCP mode, show commit output directly
        Write-Output "COMMIT: $commitOutput"
    } else {
        Write-Output-Safe "Commit: $commitOutput" "INFO"
    }
    
    # Push to main branch - capture output  
    $pushOutput = & $GitPath push origin main 2>&1
    if ($MCPMode) {
        # In MCP mode, show push output directly
        Write-Output "PUSH: $pushOutput"
    } else {
        Write-Output-Safe "Push: $pushOutput" "INFO"
    }
    
    Write-Output-Safe "Successfully committed and pushed changes" "SUCCESS"
    Write-Output-Safe "Message: $Message" "INFO"
}
catch {
    Write-Output-Safe "Error during commit: $($_.Exception.Message)" "ERROR"
    if ($Verbose) { Write-Output-Safe "Full error: $($_.Exception)" "ERROR" }
}
