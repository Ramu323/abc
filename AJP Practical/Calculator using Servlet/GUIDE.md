# Calculator Servlet - Complete Guide

## Overview
This is a web-based calculator application built with Java Servlets and Apache Tomcat. It processes arithmetic operations (addition, subtraction, multiplication, division) through an HTML form.

---

## Prerequisites
- **Java JDK 17** installed (Eclipse Adoptium at `C:\Program Files\Eclipse Adoptium\jdk-17.0.18.8-hotspot`)
- **Apache Tomcat 11.0.22** installed at `D:\apache-tomcat-11.0.22-windows-x64`
- **Windows PowerShell** terminal

---

## Project Files
```
Calculator using Servlet/
├── CalculatorServlet.java      # Main servlet class (processes calculations)
├── CalculatorServlet.class     # Compiled servlet (auto-generated)
├── calc.html                   # HTML form for user input
├── web.xml                     # Tomcat deployment descriptor
└── GUIDE.md                    # This file
```

---

## How to Run

### FIRST TIME SETUP

#### Step 1: Compile the Servlet
Open PowerShell and navigate to the project folder:

```powershell
cd "c:\Users\khair\Downloads\AJP Practical\Calculator using Servlet"
```

Compile with Tomcat's servlet library:

```powershell
javac -cp "D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22\lib\servlet-api.jar" CalculatorServlet.java
```

✓ This creates `CalculatorServlet.class`

---

#### Step 2: Deploy to Tomcat
Copy the compiled class to Tomcat's deployment folder:

```powershell
Copy-Item "CalculatorServlet.class" "D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22\webapps\calculator\WEB-INF\classes\" -Force
```

✓ Verify the file exists:
```powershell
Test-Path "D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22\webapps\calculator\WEB-INF\classes\CalculatorServlet.class"
```

Should return: `True`

---

#### Step 3: Start Tomcat
Kill any running Java processes:

```powershell
taskkill /F /IM java.exe 2>&1
Start-Sleep -Seconds 2
```

Start Tomcat:

```powershell
cd "D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22\bin"
.\startup.bat
```

Wait 3-5 seconds for Tomcat to fully start.

---

#### Step 4: Open in Browser
Navigate to:

```
http://localhost:8080/calculator/
```

✓ You should see the calculator form

---

### QUICK START (After First Setup)

If Tomcat is already running and hasn't been restarted, just visit:

```
http://localhost:8080/calculator/
```

---

## Using the Calculator

1. **Enter First Number** - Type a number (e.g., 10)
2. **Enter Second Number** - Type another number (e.g., 5)
3. **Select Operation** - Choose one:
   - ➕ **ADDITION** (+)
   - ➖ **SUBTRACTION** (-)
   - ✖️ **MULTIPLY** (*)
   - ➗ **DIVIDE** (/)
4. **Click Calculate** - See the result
5. **Click "Calculate Again"** - Go back to the form

### Example Calculations
- `10 + 5 = 15`
- `20 - 8 = 12`
- `6 * 7 = 42`
- `100 / 4 = 25`
- `10 / 0 = Error (Division by Zero)` ✗

---

## Complete Automated Script

Save this as `run-calculator.ps1` for one-click startup:

```powershell
# Navigate to project
cd "c:\Users\khair\Downloads\AJP Practical\Calculator using Servlet"

# Recompile (optional, only if you changed CalculatorServlet.java)
# javac -cp "D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22\lib\servlet-api.jar" CalculatorServlet.java
# Copy-Item "CalculatorServlet.class" "D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22\webapps\calculator\WEB-INF\classes\" -Force

# Restart Tomcat
Write-Host "Stopping Tomcat..."
taskkill /F /IM java.exe 2>&1 | Out-Null
Start-Sleep -Seconds 2

Write-Host "Starting Tomcat..."
cd "D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22\bin"
.\startup.bat

Start-Sleep -Seconds 3

Write-Host "`nOpening calculator in browser..."
Start-Process "http://localhost:8080/calculator/"
```

**Run it:**
```powershell
.\run-calculator.ps1
```

---

## If You Modify the Code

After editing `CalculatorServlet.java`:

```powershell
# 1. Recompile
javac -cp "D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22\lib\servlet-api.jar" CalculatorServlet.java

# 2. Redeploy
Copy-Item "CalculatorServlet.class" "D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22\webapps\calculator\WEB-INF\classes\" -Force

# 3. Restart Tomcat
taskkill /F /IM java.exe 2>&1
Start-Sleep -Seconds 2
cd "D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22\bin"
.\startup.bat

# 4. Test
Start-Process "http://localhost:8080/calculator/"
```

---

## Troubleshooting

### ❌ "404 Not Found" Error
**Problem:** Calculator page shows HTTP 404  
**Solution:**
- Make sure Tomcat has been restarted after deploying the servlet
- Verify `CalculatorServlet.class` exists in `WEB-INF/classes/`
- Check that `web.xml` is in `WEB-INF/` folder

### ❌ Browser shows "Connection Refused"
**Problem:** Cannot reach `http://localhost:8080`  
**Solution:**
- Tomcat isn't running - run `.\startup.bat` from Tomcat bin folder
- Check if another application is using port 8080
- Restart Tomcat: `taskkill /F /IM java.exe` then start it again

### ❌ Compilation Error: "package jakarta.servlet does not exist"
**Problem:** Classpath doesn't include servlet-api.jar  
**Solution:**
- Use the full path to servlet-api.jar:
```powershell
javac -cp "D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22\lib\servlet-api.jar" CalculatorServlet.java
```

### ❌ "Address already in use: bind"
**Problem:** Tomcat won't start - port 8005 or 8080 in use  
**Solution:**
```powershell
# Kill all Java processes
taskkill /F /IM java.exe
Start-Sleep -Seconds 3

# Start Tomcat again
cd "D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22\bin"
.\startup.bat
```

---

## How It Works

1. **User submits form** → Browser sends data to servlet
2. **Servlet receives request** → CalculatorServlet.doPost() method executes
3. **Performs calculation** → Addition, subtraction, multiplication, or division
4. **Returns result** → HTML response with styled calculator result
5. **Browser displays** → Result page with option to calculate again

---

## Files Explained

### `calc.html`
- Simple HTML form with two number inputs
- Radio buttons for operation selection
- Submit button posts to `/CalculatorServlet`

### `CalculatorServlet.java`
- Java servlet class (web component)
- Extends `HttpServlet` (Jakarta EE)
- `doPost()` method handles form submissions
- Validates input and performs arithmetic
- Returns formatted HTML response

### `web.xml`
- Tomcat deployment descriptor
- Maps servlet class to URL pattern (`/CalculatorServlet`)
- Specifies welcome file (`calc.html`)

---

## Key Information

| Item | Location |
|------|----------|
| **Tomcat Home** | `D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22` |
| **Deployed App** | `webapps\calculator\` |
| **Servlet Class** | `webapps\calculator\WEB-INF\classes\CalculatorServlet.class` |
| **Config File** | `webapps\calculator\WEB-INF\web.xml` |
| **Java Version** | JDK 17 (Jakarta EE, not legacy javax.servlet) |
| **Access URL** | `http://localhost:8080/calculator/` |

---

## Summary

- **One-line start:** `cd "D:\apache-tomcat-11.0.22-windows-x64\apache-tomcat-11.0.22\bin" && .\startup.bat`
- **Access:** Open browser to `http://localhost:8080/calculator/`
- **Stop Tomcat:** `taskkill /F /IM java.exe`
- **Redeploy:** Recompile → Copy → Restart Tomcat

✨ **That's it! Your calculator is ready to use.**
