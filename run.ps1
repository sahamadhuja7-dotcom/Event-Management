# CampusConnect PowerShell Launcher
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "         Starting CampusConnect Web Application" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

$pythonCandidates = @(
    "$env:USERPROFILE\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe",
    "$env:LOCALAPPDATA\Programs\Python\Python312\python.exe",
    "$PSScriptRoot\backend\venv\Scripts\python.exe",
    "python",
    "py"
)

$selectedPy = $null

foreach ($candidate in $pythonCandidates) {
    if (Test-Path $candidate) {
        $selectedPy = $candidate
        break
    } else {
        $cmd = Get-Command $candidate -ErrorAction SilentlyContinue
        if ($cmd) {
            try {
                $test = & $cmd.Source --version 2>&1
                if ($LASTEXITCODE -eq 0) {
                    $selectedPy = $cmd.Source
                    break
                }
            } catch {}
        }
    }
}

if (-not $selectedPy) {
    Write-Host "[ERROR] Python was not found automatically." -ForegroundColor Red
    Write-Host "Please install Python from https://www.python.org/downloads/"
    pause
    exit 1
}

Write-Host "Using Python: $selectedPy" -ForegroundColor Green
Write-Host ""

Set-Location "$PSScriptRoot\backend"
& $selectedPy app.py
