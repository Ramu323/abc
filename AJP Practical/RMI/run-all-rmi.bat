@echo off
cd /d "c:\Users\khair\Downloads\AJP Practical\RMI"

echo Compiling RMI files...
javac *.java

echo.
echo Opening RMI Registry in separate window...
start "RMI Registry" cmd /k "cd /d c:\Users\khair\Downloads\AJP Practical\RMI && rmiregistry"

timeout /t 2

echo Opening RMI Server in separate window...
start "RMI Server" cmd /k "cd /d c:\Users\khair\Downloads\AJP Practical\RMI && java rmiserver"

timeout /t 2

echo Opening RMI Client in separate window...
start "RMI Client" cmd /k "cd /d c:\Users\khair\Downloads\AJP Practical\RMI && java rmiclient"

echo.
echo All three RMI components started!
pause
