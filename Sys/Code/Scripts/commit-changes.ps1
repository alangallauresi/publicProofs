# Auto-commit script for GEOSODIC memory persistence
# Fixed core Git execution for MCP context

param(Uh
    [string]$Message = $null,
    [switch]$ConsoleMode = $false,
    [switch]$Verbose = $false
)

# Core paths - use the MINGW path that actually works
$GitPath = "C:\Program Files\Git\mingw64\bin\git.exe"
$RepoPath = "C:\src\publicProofs"

# Default to MCP-compatible mode
$MCPMode = -not $ConsoleMode

function Write-Output-Safe {
    param([string]$Text, [string]$Level = "INFO")
    
    if ($MCPMode) {
        Write-Output "[$Level] $Text"
    } else {
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
    # Navigate to repo
    Set-Location $RepoPath
    
    if ($Verbose) { Write-Output-Safe "Working directory: $(Get-Location)" "INFO" }
    if ($Verbose) { Write-Output-Safe "Using Git: $GitPath" "INFO" }
    
    # Use absolute paths for Git operations - this is the core fix
    $statusOutput = & $GitPath -C $RepoPath status --porcelain 2>&1
    
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
        if ($line.Length -lt 3) { continue }
        
        $status = $line.Substring(0, 2)
        $file = $line.Substring(3)
        
        if ($status -match "A") { $addedFiles += $file }
        elseif ($status -match "M") { $modifiedFiles += $file }
        elseif ($status -match "D") { $deletedFiles += $file }
        elseif ($status -match "\?\?") { $addedFiles += $file }
    }
    
    # Generate intelligent commit message
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
    
    # Execute Git operations with absolute paths
    $addOutput = & $GitPath -C $RepoPath add . 2>&1
    if ($Verbose -and $addOutput) { Write-Output-Safe "Git add: $addOutput" "INFO" }
    
    $commitOutput = & $GitPath -C $RepoPath commit -m $Message 2>&1
    Write-Output "COMMIT: $commitOutput"
    
    $pushOutput = & $GitPath -C $RepoPath push origin main 2>&1
    Write-Output "PUSH: $pushOutput"
    
    Write-Output-Safe "Successfully committed and pushed changes" "SUCCESS"
    Write-Output-Safe "Message: $Message" "INFO"
}
catch {
    Write-Output-Safe "Error: $($_.Exception.Message)" "ERROR"
}
