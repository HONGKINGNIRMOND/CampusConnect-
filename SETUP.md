# Setup Instructions for University LMS

## Prerequisites

Before running this application, you need to install:

1. **Java 17 or higher** (You already have Java 21 installed)
2. **Apache Maven 3.6 or higher**
3. **IDE** (IntelliJ IDEA, Eclipse, or VS Code recommended)

## Installing Maven

### Windows

1. Download Apache Maven from https://maven.apache.org/download.cgi
2. Extract the archive to a directory (e.g., `C:\apache-maven-3.9.4`)
3. Set environment variables:
   - Add `M2_HOME` = `C:\apache-maven-3.9.4`
   - Add `MAVEN_HOME` = `C:\apache-maven-3.9.4`
   - Add `%M2_HOME%\bin` to your `PATH` variable
4. Verify installation by opening a new command prompt and running:
   ```
   mvn -version
   ```

## Project Structure

The project follows a microservices architecture with two main services:

```
university-lms/
├── user-service/           # Port 8081
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/
│   │   │   │   └── com/university/lms/user/
│   │   │   │       ├── controller/
│   │   │   │       ├── model/
│   │   │   │       ├── repository/
│   │   │   │       ├── service/
│   │   │   │       └── UserServiceApplication.java
│   │   │   └── resources/
│   │   │       └── application.properties
│   │   └── test/
│   └── pom.xml
├── submission-service/     # Port 8082
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/
│   │   │   │   └── com/university/lms/submission/
│   │   │   │       ├── controller/
│   │   │   │       ├── model/
│   │   │   │       ├── repository/
│   │   │   │       ├── service/
│   │   │   │       └── SubmissionServiceApplication.java
│   │   │   └── resources/
│   │   │       └── application.properties
│   │   └── test/
│   └── pom.xml
├── pom.xml                 # Parent POM
├── README.md               # Project documentation
└── SETUP.md                # This file
```

## Building and Running the Application

### Option 1: Using the provided scripts (Recommended)

For Windows, run the batch script:
```
run-services.bat
```

For Linux/Mac, make the script executable and run:
```
chmod +x run-services.sh
./run-services.sh
```

### Option 2: Using Maven

1. Open a terminal/command prompt in the root directory (`university-lms`)
2. Compile the project:
   ```
   mvn clean compile
   ```
3. Run tests:
   ```
   mvn test
   ```
4. Package the application:
   ```
   mvn package
   ```
5. Run each service:
   ```
   mvn spring-boot:run -pl user-service
   mvn spring-boot:run -pl submission-service
   ```

### Option 3: Running JAR files

1. Package the application:
   ```
   mvn clean package
   ```
2. Run each service:
   ```
   java -jar user-service/target/user-service-0.0.1-SNAPSHOT.jar
   java -jar submission-service/target/submission-service-0.0.1-SNAPSHOT.jar
   ```

### Option 4: Using IDE

1. Import the project as a Maven project in your IDE
2. Run each `*Application.java` file separately

## Accessing the Services

Once running, the services will be available at:

- **User Service**: http://localhost:8081
- **Submission Service**: http://localhost:8082

## Database Access

Both services use H2 in-memory databases for development:

- **User Service H2 Console**: http://localhost:8081/h2-console
- **Submission Service H2 Console**: http://localhost:8082/h2-console

JDBC URL: jdbc:h2:mem:testdb
Username: sa
Password: (empty)

## API Documentation

See [README.md](README.md) for detailed API endpoints.

## Testing

Run unit tests with:
```
mvn test
```

The project includes:
- Unit tests for services using JUnit 5 and Mockito
- Controller tests using Spring's MockMvc