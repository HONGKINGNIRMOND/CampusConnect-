@echo off
echo University LMS - Building Project
echo ================================

:: Check if Maven is installed
where mvn >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Maven is not installed or not in PATH
    echo Please install Maven and add it to your PATH environment variable
    echo.
    echo Instructions:
    echo 1. Download Apache Maven from https://maven.apache.org/download.cgi
    echo 2. Extract to a directory (e.g., C:\apache-maven-3.9.4)
    echo 3. Set environment variables:
    echo    - M2_HOME = C:\apache-maven-3.9.4
    echo    - Add %%M2_HOME%%\bin to your PATH variable
    echo.
    echo Press any key to exit...
    pause >nul
    exit /b
)

echo Building root project...
mvn clean package

if %errorlevel% neq 0 (
    echo.
    echo ERROR: Build failed
    echo Please check the error messages above
    echo Press any key to exit...
    pause >nul
    exit /b
)

echo.
echo Build completed successfully!
echo JAR files are located in:
echo  - user-service\target\user-service-0.0.1-SNAPSHOT.jar
echo  - submission-service\target\submission-service-0.0.1-SNAPSHOT.jar

echo.
echo To run the services, you can now use:
echo  - run-jars.bat (to run from JAR files)
echo  - run-services.bat (to run with Maven)
echo.
echo Press any key to exit...
pause >nul