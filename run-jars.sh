#!/bin/bash

echo "University LMS - Starting Services from JAR files"
echo "================================================="

echo "Checking if JAR files exist..."

if [ ! -f "user-service/target/user-service-0.0.1-SNAPSHOT.jar" ]; then
    echo "ERROR: User Service JAR not found"
    echo "Please build the project first using: mvn clean package"
    echo "Or run the services using your IDE"
    exit 1
fi

if [ ! -f "submission-service/target/submission-service-0.0.1-SNAPSHOT.jar" ]; then
    echo "ERROR: Submission Service JAR not found"
    echo "Please build the project first using: mvn clean package"
    echo "Or run the services using your IDE"
    exit 1
fi

echo "Starting User Service..."
cd user-service
gnome-terminal --title="User Service" -- java -jar target/user-service-0.0.1-SNAPSHOT.jar
cd ..

echo "Starting Submission Service..."
cd submission-service
gnome-terminal --title="Submission Service" -- java -jar target/submission-service-0.0.1-SNAPSHOT.jar
cd ..

echo "Services started. User Service on port 8081, Submission Service on port 8082"
echo ""
echo "To stop the services, close the opened terminal windows"