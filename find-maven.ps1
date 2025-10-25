# University LMS - Maven Finder
# PowerShell script to locate Maven installation

Write-Host "University LMS - Maven Finder" -ForegroundColor Green
Write-Host "===========================" -ForegroundColor Green
Write-Host ""

Write-Host "1. Checking if Maven is in PATH..." -ForegroundColor Yellow
try {
    $mvnPath = Get-Command mvn -ErrorAction Stop
    Write-Host "[FOUND] Maven is in PATH" -ForegroundColor Green
    Write-Host "Location: $($mvnPath.Source)" -ForegroundColor Cyan
    Write-Host "Version:" -ForegroundColor Yellow
    mvn -version
} catch {
    Write-Host "[NOT FOUND] Maven is not in PATH" -ForegroundColor Red
}

Write-Host ""
Write-Host "2. Searching common installation locations..." -ForegroundColor Yellow

$commonPaths = @(
    "C:\apache-maven-*",
    "C:\Program Files\apache-maven-*",
    "C:\Program Files (x86)\apache-maven-*",
    "D:\apache-maven-*",
    "$env:USERPROFILE\apache-maven-*"
)

$mavenFound = $false

foreach ($path in $commonPaths) {
    $mavenDirs = Get-ChildItem -Path $path -Directory -ErrorAction SilentlyContinue
    foreach ($dir in $mavenDirs) {
        if (Test-Path "$($dir.FullName)\bin\mvn.cmd") {
            Write-Host "[FOUND] Maven at $($dir.FullName)" -ForegroundColor Green
            $mavenFound = $true
        }
    }
}

if (-not $mavenFound) {
    Write-Host "[NOT FOUND] Maven not found in common locations" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please download Maven from https://maven.apache.org/download.cgi" -ForegroundColor Yellow
    Write-Host "And extract it to a directory like C:\apache-maven-3.9.11" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Search complete." -ForegroundColor Green
Write-Host "Press any key to continue..."
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")