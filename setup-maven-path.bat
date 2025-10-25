@echo off
echo University LMS - Maven PATH Setup
echo ==============================

echo This script will help you add Maven to your PATH environment variable.
echo.

:: Try to find Maven installation
set MAVEN_HOME=
if exist "C:\apache-maven-3.9.11" (
    set MAVEN_HOME=C:\apache-maven-3.9.11
) else if exist "C:\Program Files\apache-maven-3.9.11" (
    set MAVEN_HOME=C:\Program Files\apache-maven-3.9.11
) else if exist "C:\Program Files (x86)\apache-maven-3.9.11" (
    set MAVEN_HOME=C:\Program Files (x86)\apache-maven-3.9.11
) else if exist "D:\apache-maven-3.9.11" (
    set MAVEN_HOME=D:\apache-maven-3.9.11
)

if "%MAVEN_HOME%"=="" (
    echo Maven installation not found in common locations.
    echo Please enter the path to your Maven installation:
    echo ^(e.g., C:\apache-maven-3.9.11^)
    set /p MAVEN_HOME="Maven Home: "
)

if "%MAVEN_HOME%"=="" (
    echo No Maven path provided. Exiting.
    pause
    exit /b
)

echo.
echo Adding %MAVEN_HOME%\bin to your PATH...

:: Add to user PATH
setx PATH "%PATH%;%MAVEN_HOME%\bin"

echo.
echo Maven has been added to your PATH.
echo Please close and reopen your command prompt for changes to take effect.
echo Then you can run run-services.bat to start the services.
echo.
pause