# ====================================
# Calculator Servlet - Quick Start
# ====================================

Write-Host "`nStarting Calculator Servlet Application...`n" -ForegroundColor Cyan

# Stop any running Tomcat/Java processes
Write-Host "[1/3] Stopping existing Java processes..." -ForegroundColor Yellow
taskkill /F /IM java.exe 2>&1 | Out-Null
Start-Sleep -Seconds 2

# Start Tomcat
Write-Host "[2/3] Starting Apache Tomcat..." -ForegroundColor Yellow
Set-Location "D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22\bin"
& .\startup.bat | Out-Null

Start-Sleep -Seconds 4

# Open browser
Write-Host "[3/3] Opening calculator in browser..." -ForegroundColor Yellow
Start-Process "http://localhost:8080/calculator/"

Write-Host "`n====================================`n" -ForegroundColor Green
Write-Host "Calculator is ready at:" -ForegroundColor Green
Write-Host "http://localhost:8080/calculator/" -ForegroundColor Cyan
Write-Host "`n====================================" -ForegroundColor Green
Write-Host "`nPress Enter to exit this script..." -ForegroundColor Yellow
Read-Host
