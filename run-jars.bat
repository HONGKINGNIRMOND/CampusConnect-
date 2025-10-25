@echo off
echo University LMS - Starting Services from JAR files
echo =================================================

echo Checking if JAR files exist...

if not exist "user-service\target\user-service-0.0.1-SNAPSHOT.jar" (
    echo ERROR: User Service JAR not found
    echo Please build the project first using: mvn clean package
    echo Or run the services using your IDE
    echo Press any key to exit...
    pause >nul
    exit /b
)

if not exist "submission-service\target\submission-service-0.0.1-SNAPSHOT.jar" (
    echo ERROR: Submission Service JAR not found
    echo Please build the project first using: mvn clean package
    echo Or run the services using your IDE
    echo Press any key to exit...
    pause >nul
    exit /b
)

echo Starting User Service...
cd user-service
start "User Service" cmd /k "java -jar target/user-service-0.0.1-SNAPSHOT.jar"
cd ..

echo Starting Submission Service...
cd submission-service
start "Submission Service" cmd /k "java -jar target/submission-service-0.0.1-SNAPSHOT.jar"
cd ..

echo Services started. User Service on port 8081, Submission Service on port 8082
echo.
echo To stop the services, close the opened command prompt windows
echo Press any key to exit...
pause >nul