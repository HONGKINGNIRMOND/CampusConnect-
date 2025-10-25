# Project Structure Diagram

## Overall Architecture

```mermaid
graph TD
    A[Client/Browser] --> B[User Service<br/>Port: 8081]
    A --> C[Submission Service<br/>Port: 8082]
    B --> D[H2 Database<br/>userdb]
    C --> E[H2 Database<br/>submissiondb]
```

## User Service Structure

```mermaid
graph TD
    A[User Service] --> B[Controllers]
    A --> C[Services]
    A --> D[Repositories]
    A --> E[Models]
    A --> F[Templates]
    
    B --> B1[HomeController]
    B --> B2[StudentController]
    B --> B3[FacultyController]
    
    C --> C1[StudentService]
    C --> C2[FacultyService]
    
    D --> D1[StudentRepository]
    D --> D2[FacultyRepository]
    
    E --> E1[Student]
    E --> E2[Faculty]
    
    F --> F1[index.html]
    F --> F2[students.html]
    F --> F3[faculties.html]
```

## Submission Service Structure

```mermaid
graph TD
    A[Submission Service] --> B[Controllers]
    A --> C[Services]
    A --> D[Repositories]
    A --> E[Models]
    A --> F[Templates]
    
    B --> B1[HomeController]
    B --> B2[AssignmentController]
    B --> B3[SubmissionController]
    B --> B4[ProjectController]
    
    C --> C1[AssignmentService]
    C --> C2[SubmissionService]
    C --> C3[ProjectService]
    
    D --> D1[AssignmentRepository]
    D --> D2[SubmissionRepository]
    D --> D3[ProjectRepository]
    
    E --> E1[Assignment]
    E --> E2[Submission]
    E --> E3[Project]
    
    F --> F1[index.html]
    F --> F2[assignments.html]
    F --> F3[submissions.html]
    F --> F4[projects.html]
```

## Entity Relationships

### User Service Entities

```mermaid
erDiagram
    STUDENT ||--o{ SUBMISSION : "submits"
    FACULTY ||--o{ ASSIGNMENT : "creates"
    FACULTY ||--o{ PROJECT : "creates"
```

### Submission Service Entities

```mermaid
erDiagram
    ASSIGNMENT ||--o{ SUBMISSION : "has"
    PROJECT ||--o{ TASK : "contains"
```

Note: The TASK entity was mentioned in the requirements but not implemented as a separate entity. It could be implemented as part of the Project entity or as a separate entity in future enhancements.