# Running the University LMS Application

## Prerequisites

Before running this application, you need to install:

1. **Java 17 or higher** (You already have Java 21 installed)
2. **Apache Maven 3.6 or higher**

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

## Building and Running the Application

### Option 1: Using the provided scripts (Recommended)

We provide several scripts to help you build and run the application:

1. **Build the project** (compiles and packages into JAR files):
   - Windows: `build-project.bat`
   - Linux/Mac: `chmod +x build-project.sh && ./build-project.sh`

2. **Run services using Maven** (requires Maven to be installed):
   - Windows: `run-services.bat`
   - Linux/Mac: `chmod +x run-services.sh && ./run-services.sh`

3. **Run services from JAR files** (after building the project):
   - Windows: `run-jars.bat`
   - Linux/Mac: `chmod +x run-jars.sh && ./run-jars.sh`

### Option 2: Manual execution

1. Open a terminal/command prompt in the root directory (`spring-boot-lms`)

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

5. Run each service in separate terminals:
   ```
   # Terminal 1
   cd user-service
   mvn spring-boot:run
   
   # Terminal 2
   cd submission-service
   mvn spring-boot:run
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

## API Endpoints

### User Service

#### Student Endpoints
- `GET /api/students` - Get all students
- `GET /api/students/{id}` - Get student by ID
- `POST /api/students` - Create a new student
- `PUT /api/students/{id}` - Update student by ID
- `DELETE /api/students/{id}` - Delete student by ID

#### Faculty Endpoints
- `GET /api/faculties` - Get all faculties
- `GET /api/faculties/{id}` - Get faculty by ID
- `POST /api/faculties` - Create a new faculty
- `PUT /api/faculties/{id}` - Update faculty by ID
- `DELETE /api/faculties/{id}` - Delete faculty by ID

### Submission Service

#### Assignment Endpoints
- `GET /api/assignments` - Get all assignments
- `GET /api/assignments/{id}` - Get assignment by ID
- `GET /api/assignments/faculty/{facultyId}` - Get assignments by faculty ID
- `POST /api/assignments` - Create a new assignment
- `PUT /api/assignments/{id}` - Update assignment by ID
- `DELETE /api/assignments/{id}` - Delete assignment by ID

#### Submission Endpoints
- `GET /api/submissions` - Get all submissions
- `GET /api/submissions/{id}` - Get submission by ID
- `GET /api/submissions/student/{studentId}` - Get submissions by student ID
- `GET /api/submissions/assignment/{assignmentId}` - Get submissions by assignment ID
- `POST /api/submissions` - Create a new submission
- `PUT /api/submissions/{id}` - Update submission by ID
- `DELETE /api/submissions/{id}` - Delete submission by ID

#### Project Endpoints
- `GET /api/projects` - Get all projects
- `GET /api/projects/{id}` - Get project by ID
- `GET /api/projects/faculty/{facultyId}` - Get projects by faculty ID
- `POST /api/projects` - Create a new project
- `PUT /api/projects/{id}` - Update project by ID
- `DELETE /api/projects/{id}` - Delete project by ID

## Testing

Run unit tests with:
```
mvn test
```

The project includes:
- Unit tests for services using JUnit 5 and Mockito
- Controller tests using Spring's MockMvc