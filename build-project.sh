#!/bin/bash

echo "University LMS - Building Project"
echo "================================"

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
    exit 1
fi

echo "Building root project..."
mvn clean package

if [ $? -ne 0 ]; then
    echo ""
    echo "ERROR: Build failed"
    echo "Please check the error messages above"
    exit 1
fi

echo ""
echo "Build completed successfully!"
echo "JAR files are located in:"
echo " - user-service/target/user-service-0.0.1-SNAPSHOT.jar"
echo " - submission-service/target/submission-service-0.0.1-SNAPSHOT.jar"

echo ""
echo "To run the services, you can now use:"
echo " - ./run-jars.sh (to run from JAR files)"
echo " - ./run-services.sh (to run with Maven)"