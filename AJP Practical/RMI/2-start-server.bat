@echo off
title RMI Server
cd /d "c:\Users\khair\Downloads\AJP Practical\RMI"
echo Compiling RMI files...
javac *.java
echo.
echo Starting RMI Server...
echo Keep this window open while running the client
java rmiserver
pause
