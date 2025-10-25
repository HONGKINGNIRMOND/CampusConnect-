@echo off
echo University LMS - Status Check
echo ===========================

echo Checking Java installation...
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Java is not installed or not in PATH
) else (
    echo [OK] Java is installed
    java -version
)

echo.
echo Checking Maven installation...
where mvn >nul 2>&1
if %errorlevel% neq 0 (
    echo [WARNING] Maven is not installed or not in PATH
    echo          You can still run the application using JAR files
) else (
    echo [OK] Maven is installed
    for /f "tokens=*" %%i in ('mvn -version ^| findstr "Apache Maven"') do set MAVEN_VERSION=%%i
    echo %MAVEN_VERSION%
)

echo.
echo Checking project structure...
if exist "user-service\src\main\java\com\university\lms\user\UserServiceApplication.java" (
    echo [OK] User Service source files found
) else (
    echo [ERROR] User Service source files missing
)

if exist "submission-service\src\main\java\com\university\lms\submission\SubmissionServiceApplication.java" (
    echo [OK] Submission Service source files found
) else (
    echo [ERROR] Submission Service source files missing
)

echo.
echo Checking build artifacts...
if exist "user-service\target\user-service-0.0.1-SNAPSHOT.jar" (
    echo [OK] User Service JAR file found
) else (
    echo [INFO] User Service JAR file not found (run build-project.bat to create it)
)

if exist "submission-service\target\submission-service-0.0.1-SNAPSHOT.jar" (
    echo [OK] Submission Service JAR file found
) else (
    echo [INFO] Submission Service JAR file not found (run build-project.bat to create it)
)

echo.
echo Status check complete.
echo.
echo To run the application:
echo 1. If Maven is installed: run-services.bat
echo 2. If JAR files exist: run-jars.bat
echo 3. If neither: build-project.bat first, then run-jars.bat
echo.
pause