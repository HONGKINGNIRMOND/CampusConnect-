@echo off
setlocal enabledelayedexpansion

echo University LMS - Starting Services
echo =================================

:: Function to find Maven
set MAVEN_CMD=
set MAVEN_FOUND=false

:: Check if Maven is in PATH
where mvn >nul 2>&1
if %errorlevel% equ 0 (
    set MAVEN_CMD=mvn
    set MAVEN_FOUND=true
    echo Found Maven in PATH
) else (
    :: Try to find Maven in common installation locations
    if exist "C:\apache-maven-3.9.11\bin\mvn.cmd" (
        set MAVEN_CMD=C:\apache-maven-3.9.11\bin\mvn.cmd
        set MAVEN_FOUND=true
        echo Found Maven at C:\apache-maven-3.9.11
    ) else if exist "C:\Program Files\apache-maven-3.9.11\bin\mvn.cmd" (
        set MAVEN_CMD="C:\Program Files\apache-maven-3.9.11\bin\mvn.cmd"
        set MAVEN_FOUND=true
        echo Found Maven at C:\Program Files\apache-maven-3.9.11
    ) else if exist "C:\Program Files (x86)\apache-maven-3.9.11\bin\mvn.cmd" (
        set MAVEN_CMD="C:\Program Files (x86)\apache-maven-3.9.11\bin\mvn.cmd"
        set MAVEN_FOUND=true
        echo Found Maven at C:\Program Files (x86)\apache-maven-3.9.11
    ) else if exist "D:\apache-maven-3.9.11\bin\mvn.cmd" (
        set MAVEN_CMD=D:\apache-maven-3.9.11\bin\mvn.cmd
        set MAVEN_FOUND=true
        echo Found Maven at D:\apache-maven-3.9.11
    ) else (
        :: Try to find any Maven installation
        for /d %%i in ("C:\apache-maven-*") do (
            if exist "%%i\bin\mvn.cmd" (
                set MAVEN_CMD="%%i\bin\mvn.cmd"
                set MAVEN_FOUND=true
                echo Found Maven at %%i
            )
        )
        if "!MAVEN_FOUND!"=="false" (
            for /d %%i in ("D:\apache-maven-*") do (
                if exist "%%i\bin\mvn.cmd" (
                    set MAVEN_CMD="%%i\bin\mvn.cmd"
                    set MAVEN_FOUND=true
                    echo Found Maven at %%i
                )
            )
        )
    )
)

if "!MAVEN_FOUND!"=="false" (
    echo ERROR: Maven 3.9.11 not found
    echo.
    echo Please ensure Maven is:
    echo 1. Installed and added to your PATH environment variable, or
    echo 2. Installed in a common location like C:\apache-maven-3.9.11
    echo.
    echo Alternatively, you can:
    echo 1. Run each service manually in your IDE
    echo 2. Build and run from JAR files ^(build-project.bat and run-jars.bat^)
    echo.
    pause
    exit /b
)

echo Starting services with Maven...
echo Using Maven command: !MAVEN_CMD!

echo.
echo Building User Service...
cd user-service
start "User Service" cmd /k "!MAVEN_CMD! spring-boot:run"
cd ..

echo Building Submission Service...
cd submission-service
start "Submission Service" cmd /k "!MAVEN_CMD! spring-boot:run"
cd ..

echo Services started. User Service on port 8081, Submission Service on port 8082
echo.
echo To stop the services, close the opened command prompt windows
echo Press any key to exit...
pause >nul