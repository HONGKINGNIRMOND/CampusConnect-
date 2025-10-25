@echo off
echo University LMS - Maven Locator
echo ===========================

echo Searching for Maven installation...

:: Check if Maven is in PATH
echo.
echo 1. Checking if Maven is in PATH...
where mvn >nul 2>&1
if %errorlevel% equ 0 (
    echo [FOUND] Maven is in PATH
    for /f "tokens=*" %%i in ('where mvn') do set MAVEN_PATH=%%i
    echo Location: %MAVEN_PATH%
    echo Version:
    mvn -version
) else (
    echo [NOT FOUND] Maven is not in PATH
)

:: Check common installation locations
echo.
echo 2. Checking common installation locations...

set MAVEN_FOUND=false

:: Check C:\apache-maven-* directories
for /d %%i in ("C:\apache-maven-*") do (
    if exist "%%i\bin\mvn.cmd" (
        echo [FOUND] Maven in %%i
        set MAVEN_FOUND=true
    )
)

:: Check Program Files
if exist "C:\Program Files\apache-maven-*\bin\mvn.cmd" (
    echo [FOUND] Maven in C:\Program Files\apache-maven-*
    set MAVEN_FOUND=true
)

if exist "C:\Program Files (x86)\apache-maven-*\bin\mvn.cmd" (
    echo [FOUND] Maven in C:\Program Files (x86)\apache-maven-*
    set MAVEN_FOUND=true
)

:: Check D:\apache-maven-* directories
for /d %%i in ("D:\apache-maven-*") do (
    if exist "%%i\bin\mvn.cmd" (
        echo [FOUND] Maven in %%i
        set MAVEN_FOUND=true
    )
)

:: Check user directory
for /d %%i in ("%USERPROFILE%\apache-maven-*") do (
    if exist "%%i\bin\mvn.cmd" (
        echo [FOUND] Maven in %%i
        set MAVEN_FOUND=true
    )
)

if "%MAVEN_FOUND%"=="false" (
    echo [NOT FOUND] Maven not found in common locations
    echo.
    echo Please install Maven from https://maven.apache.org/download.cgi
    echo And extract it to a directory like C:\apache-maven-3.9.11
)

echo.
echo Search complete.
pause