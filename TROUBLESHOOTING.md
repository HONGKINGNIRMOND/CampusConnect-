# Troubleshooting Guide - University LMS Application

## Common Issues and Solutions

### 1. "mvn is not recognized" or "command not found" Error

**Problem**: When running `run-services.bat` or `run-services.sh`, you get an error that Maven is not installed or not in PATH.

**Solution**:
1. Install Maven following the instructions in RUNNING_INSTRUCTIONS.md
2. OR use the JAR-based scripts:
   - Windows: `run-jars.bat`
   - Linux/Mac: `./run-jars.sh` (after building with `./build-project.sh`)

### 2. "JAR file not found" Error

**Problem**: When running `run-jars.bat` or `run-jars.sh`, you get an error that the JAR files don't exist.

**Solution**:
1. Build the project first:
   - Windows: `build-project.bat`
   - Linux/Mac: `./build-project.sh`
2. Then run the JAR scripts

### 3. Port Already in Use

**Problem**: When starting the services, you get an error that port 8081 or 8082 is already in use.

**Solution**:
1. Find and terminate the processes using those ports:
   - Windows: 
     ```
     netstat -ano | findstr :8081
     taskkill /PID <process_id> /F
     ```
   - Linux/Mac:
     ```
     lsof -i :8081
     kill -9 <process_id>
     ```
2. Or modify the port numbers in the application.properties files

### 4. Database Connection Issues

**Problem**: Problems connecting to the H2 database.

**Solution**:
1. Ensure the services are running
2. Access the H2 console at:
   - User Service: http://localhost:8081/h2-console
   - Submission Service: http://localhost:8082/h2-console
3. Use these settings:
   - JDBC URL: jdbc:h2:mem:testdb
   - Username: sa
   - Password: (leave empty)

### 5. IDE Import Issues

**Problem**: Issues importing the project into your IDE.

**Solution**:
1. Import as a Maven project (not individual modules)
2. Refresh/reimport Maven dependencies
3. Check that your IDE is using Java 17 or higher

### 6. Compilation Errors

**Problem**: Compilation errors when building the project.

**Solution**:
1. Ensure you're using Java 17 or higher
2. Check that all source files are properly created (run verify-structure.bat)
3. Clean and rebuild the project:
   ```
   mvn clean compile
   ```

## Alternative Running Methods

### Method 1: Direct IDE Execution
1. Open the project in your IDE
2. Run [UserServiceApplication.java](file://d:\DOWNLOAD\spring%20boot\spring-boot-lms\user-service\src\main\java\com\university\lms\user\UserServiceApplication.java) 
3. Run [SubmissionServiceApplication.java](file://d:\DOWNLOAD\spring%20boot\spring-boot-lms\submission-service\src\main\java\com\university\lms\submission\SubmissionServiceApplication.java)

### Method 2: Manual Terminal Execution
1. Open two terminal windows
2. In the first terminal:
   ```
   cd user-service
   mvn spring-boot:run
   ```
3. In the second terminal:
   ```
   cd submission-service
   mvn spring-boot:run
   ```

## Verifying the Installation

Run the verification script to check if all files are properly created:
- Windows: `verify-structure.bat`
- Linux/Mac: `chmod +x verify-structure.bat && ./verify-structure.bat`

All files should show "[OK]" status.

## Getting Help

If you continue to experience issues:

1. Check that all prerequisites are installed (Java 17+, Maven)
2. Verify file structure with the verification script
3. Review the setup instructions in SETUP.md
4. Check the final summary in FINAL_SUMMARY.md

For additional support, please provide:
- The exact error message
- Your operating system
- Java and Maven versions (`java -version` and `mvn -version`)