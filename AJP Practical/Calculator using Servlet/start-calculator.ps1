# ====================================
# Calculator Servlet - One Click Start
# ====================================

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$appName = "calculator"
$appUrl = "http://localhost:8080/$appName/"
$srcJava = Join-Path $scriptDir "CalculatorServlet.java"
$srcWebXml = Join-Path $scriptDir "web.xml"

$tomcatHome = $env:CATALINA_HOME
if (-not $tomcatHome -or -not (Test-Path (Join-Path $tomcatHome "bin\startup.bat"))) {
	$candidates = @(
		"D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22",
		"C:\apache-tomcat-11.0.22",
		"C:\apache-tomcat-10.1.39"
	)
	foreach ($path in $candidates) {
		if (Test-Path (Join-Path $path "bin\startup.bat")) {
			$tomcatHome = $path
			break
		}
	}
}

if (-not $tomcatHome) {
	Write-Host "Tomcat not found. Set CATALINA_HOME or update this script path." -ForegroundColor Red
	Read-Host "Press Enter to exit"
	exit 1
}

$env:CATALINA_HOME = $tomcatHome
$env:CATALINA_BASE = $tomcatHome

Write-Host "`nStarting one-click calculator deployment...`n" -ForegroundColor Cyan
Write-Host "Tomcat: $tomcatHome`n" -ForegroundColor DarkCyan

if (-not (Get-Command javac -ErrorAction SilentlyContinue)) {
	Write-Host "javac not found. Install JDK and set JAVA_HOME/PATH." -ForegroundColor Red
	Read-Host "Press Enter to exit"
	exit 1
}

Write-Host "[1/6] Preparing build folders..." -ForegroundColor Yellow
$classesDir = Join-Path $scriptDir "WEB-INF\classes"
New-Item -ItemType Directory -Path $classesDir -Force | Out-Null

Write-Host "[2/6] Compiling servlet..." -ForegroundColor Yellow
& javac -cp "$tomcatHome\lib\*" -d $classesDir $srcJava
if ($LASTEXITCODE -ne 0) {
	Write-Host "Compilation failed. Fix errors and run again." -ForegroundColor Red
	Read-Host "Press Enter to exit"
	exit 1
}

Write-Host "[3/6] Deploying app to Tomcat webapps..." -ForegroundColor Yellow
$deployDir = Join-Path $tomcatHome "webapps\$appName"
if (Test-Path $deployDir) {
	Remove-Item -Recurse -Force $deployDir
}
New-Item -ItemType Directory -Path $deployDir -Force | Out-Null
Copy-Item -Recurse -Force (Join-Path $scriptDir "*") $deployDir

$deployWebInf = Join-Path $deployDir "WEB-INF"
New-Item -ItemType Directory -Path $deployWebInf -Force | Out-Null
Copy-Item -Force $srcWebXml (Join-Path $deployWebInf "web.xml")

$deployMetaInf = Join-Path $deployDir "META-INF"
New-Item -ItemType Directory -Path $deployMetaInf -Force | Out-Null
Set-Content -Path (Join-Path $deployMetaInf "context.xml") -Value '<Context reloadable="true"/>' -Encoding ascii

Write-Host "[4/6] Restarting Tomcat..." -ForegroundColor Yellow
& (Join-Path $tomcatHome "bin\shutdown.bat") 2>&1 | Out-Null
Start-Sleep -Seconds 2
& (Join-Path $tomcatHome "bin\startup.bat")

Write-Host "[5/6] Waiting for server startup..." -ForegroundColor Yellow
Start-Sleep -Seconds 5

Write-Host "[6/6] Opening browser..." -ForegroundColor Yellow
Start-Process $appUrl

Write-Host "`n====================================" -ForegroundColor Green
Write-Host "Done. Calculator is running at:" -ForegroundColor Green
Write-Host $appUrl -ForegroundColor Cyan
Write-Host "====================================`n" -ForegroundColor Green
Read-Host "Press Enter to exit"
