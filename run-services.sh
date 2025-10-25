#!/bin/bash

echo "University LMS - Starting Services"
echo "================================="

# Check if Maven is installed
if ! command -v mvn &> /dev/null
then
    echo "ERROR: Maven is not installed or not in PATH"
    echo "Please install Maven and add it to your PATH environment variable"
    echo ""
    echo "Instructions:"
    echo "1. Download Apache Maven from https://maven.apache.org/download.cgi"
    echo "2. Extract to a directory (e.g., /opt/apache-maven-3.9.4)"
    echo "3. Set environment variables:"
    echo "   - M2_HOME=/opt/apache-maven-3.9.4"
    echo "   - Add \$M2_HOME/bin to your PATH variable"
    echo ""
    echo "Alternatively, run each service manually in your IDE"
    exit 1
fi

echo "Building User Service..."
cd user-service
gnome-terminal --title="User Service" -- mvn spring-boot:run
cd ..

echo "Building Submission Service..."
cd submission-service
gnome-terminal --title="Submission Service" -- mvn spring-boot:run
cd ..

echo "Services started. User Service on port 8081, Submission Service on port 8082"
echo ""
echo "To stop the services, close the opened terminal windows"