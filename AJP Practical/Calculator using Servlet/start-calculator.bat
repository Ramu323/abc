@echo off
REM ====================================
REM Calculator Servlet - Quick Start
REM ====================================

echo.
echo Starting Calculator Servlet Application...
echo.

REM Stop any running Tomcat/Java processes
echo [1/3] Stopping existing Java processes...
taskkill /F /IM java.exe >nul 2>&1
timeout /t 2 /nobreak

REM Start Tomcat
echo [2/3] Starting Apache Tomcat...
cd /D "D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22\bin"
call startup.bat >nul 2>&1

timeout /t 4 /nobreak

REM Open browser
echo [3/3] Opening calculator in browser...
start http://localhost:8080/calculator/

echo.
echo ====================================
echo Calculator is ready at:
echo http://localhost:8080/calculator/
echo ====================================
echo.
pause
