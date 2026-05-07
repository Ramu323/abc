@echo off
setlocal EnableExtensions EnableDelayedExpansion

REM ====================================
REM Calculator Servlet - One Click Start
REM ====================================

set "SCRIPT_DIR=%~dp0"
set "APP_NAME=calculator"
set "APP_URL=http://localhost:8080/%APP_NAME%/"
set "SRC_JAVA=%SCRIPT_DIR%CalculatorServlet.java"
set "SRC_WEBXML=%SCRIPT_DIR%web.xml"

set "TOMCAT_HOME="
if defined CATALINA_HOME if exist "%CATALINA_HOME%\bin\startup.bat" set "TOMCAT_HOME=%CATALINA_HOME%"
if not defined TOMCAT_HOME if exist "D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22\bin\startup.bat" set "TOMCAT_HOME=D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22"
if not defined TOMCAT_HOME if exist "C:\apache-tomcat-11.0.22\bin\startup.bat" set "TOMCAT_HOME=C:\apache-tomcat-11.0.22"
if not defined TOMCAT_HOME if exist "C:\apache-tomcat-10.1.39\bin\startup.bat" set "TOMCAT_HOME=C:\apache-tomcat-10.1.39"

if not defined TOMCAT_HOME (
	echo.
	echo ERROR: Tomcat not found.
	echo Set CATALINA_HOME or edit this file with your Tomcat path.
	echo.
	pause
	exit /b 1
)

set "CATALINA_HOME=%TOMCAT_HOME%"
set "CATALINA_BASE=%TOMCAT_HOME%"

echo.
echo Starting one-click calculator deployment...
echo Tomcat: %TOMCAT_HOME%
echo.

where javac >nul 2>&1
if errorlevel 1 (
	echo ERROR: javac not found. Install JDK and set JAVA_HOME and PATH.
	pause
	exit /b 1
)

echo [1/6] Preparing build folders...
if not exist "%SCRIPT_DIR%WEB-INF\classes" mkdir "%SCRIPT_DIR%WEB-INF\classes"

echo [2/6] Compiling servlet...
javac -cp "%TOMCAT_HOME%\lib\*" -d "%SCRIPT_DIR%WEB-INF\classes" "%SRC_JAVA%"
if errorlevel 1 (
	echo.
	echo Compilation failed. Fix errors and run this file again.
	echo.
	pause
	exit /b 1
)

echo [3/6] Deploying app to Tomcat webapps...
set "DEPLOY_DIR=%TOMCAT_HOME%\webapps\%APP_NAME%"
if exist "%DEPLOY_DIR%" rmdir /S /Q "%DEPLOY_DIR%"
mkdir "%DEPLOY_DIR%"
xcopy "%SCRIPT_DIR%*" "%DEPLOY_DIR%\" /E /I /Y >nul

if not exist "%DEPLOY_DIR%\WEB-INF" mkdir "%DEPLOY_DIR%\WEB-INF"
copy /Y "%SRC_WEBXML%" "%DEPLOY_DIR%\WEB-INF\web.xml" >nul

if not exist "%DEPLOY_DIR%\META-INF" mkdir "%DEPLOY_DIR%\META-INF"
> "%DEPLOY_DIR%\META-INF\context.xml" echo ^<Context reloadable="true" /^>

echo [4/6] Restarting Tomcat...
call "%TOMCAT_HOME%\bin\shutdown.bat" >nul 2>&1
timeout /t 2 /nobreak >nul
call "%TOMCAT_HOME%\bin\startup.bat"

echo [5/6] Waiting for server startup...
timeout /t 5 /nobreak >nul

echo [6/6] Opening browser...
start "" "%APP_URL%"

echo.
echo ====================================
echo Done. Calculator is running at:
echo %APP_URL%
echo ====================================
echo.
pause
