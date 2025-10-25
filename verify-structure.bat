@echo off
echo University LMS - Structure Verification
echo ======================================

echo Checking User Service structure...
if exist "user-service\src\main\java\com\university\lms\user\UserServiceApplication.java" (
    echo [OK] UserServiceApplication.java found
) else (
    echo [ERROR] UserServiceApplication.java not found
)

if exist "user-service\src\main\java\com\university\lms\user\controller\HomeController.java" (
    echo [OK] HomeController.java found
) else (
    echo [ERROR] HomeController.java not found
)

if exist "user-service\src\main\java\com\university\lms\user\controller\StudentController.java" (
    echo [OK] StudentController.java found
) else (
    echo [ERROR] StudentController.java not found
)

if exist "user-service\src\main\java\com\university\lms\user\controller\FacultyController.java" (
    echo [OK] FacultyController.java found
) else (
    echo [ERROR] FacultyController.java not found
)

if exist "user-service\src\main\java\com\university\lms\user\model\Student.java" (
    echo [OK] Student.java found
) else (
    echo [ERROR] Student.java not found
)

if exist "user-service\src\main\java\com\university\lms\user\model\Faculty.java" (
    echo [OK] Faculty.java found
) else (
    echo [ERROR] Faculty.java not found
)

if exist "user-service\src\main\java\com\university\lms\user\repository\StudentRepository.java" (
    echo [OK] StudentRepository.java found
) else (
    echo [ERROR] StudentRepository.java not found
)

if exist "user-service\src\main\java\com\university\lms\user\repository\FacultyRepository.java" (
    echo [OK] FacultyRepository.java found
) else (
    echo [ERROR] FacultyRepository.java not found
)

if exist "user-service\src\main\java\com\university\lms\user\service\StudentService.java" (
    echo [OK] StudentService.java found
) else (
    echo [ERROR] StudentService.java not found
)

if exist "user-service\src\main\java\com\university\lms\user\service\FacultyService.java" (
    echo [OK] FacultyService.java found
) else (
    echo [ERROR] FacultyService.java not found
)

if exist "user-service\src\main\resources\templates\index.html" (
    echo [OK] User Service index.html found
) else (
    echo [ERROR] User Service index.html not found
)

if exist "user-service\src\main\resources\templates\students.html" (
    echo [OK] students.html found
) else (
    echo [ERROR] students.html not found
)

if exist "user-service\src\main\resources\templates\faculties.html" (
    echo [OK] faculties.html found
) else (
    echo [ERROR] faculties.html not found
)

echo.
echo Checking Submission Service structure...
if exist "submission-service\src\main\java\com\university\lms\submission\SubmissionServiceApplication.java" (
    echo [OK] SubmissionServiceApplication.java found
) else (
    echo [ERROR] SubmissionServiceApplication.java not found
)

if exist "submission-service\src\main\java\com\university\lms\submission\controller\HomeController.java" (
    echo [OK] HomeController.java found
) else (
    echo [ERROR] HomeController.java not found
)

if exist "submission-service\src\main\java\com\university\lms\submission\controller\AssignmentController.java" (
    echo [OK] AssignmentController.java found
) else (
    echo [ERROR] AssignmentController.java not found
)

if exist "submission-service\src\main\java\com\university\lms\submission\controller\SubmissionController.java" (
    echo [OK] SubmissionController.java found
) else (
    echo [ERROR] SubmissionController.java not found
)

if exist "submission-service\src\main\java\com\university\lms\submission\controller\ProjectController.java" (
    echo [OK] ProjectController.java found
) else (
    echo [ERROR] ProjectController.java not found
)

if exist "submission-service\src\main\java\com\university\lms\submission\model\Assignment.java" (
    echo [OK] Assignment.java found
) else (
    echo [ERROR] Assignment.java not found
)

if exist "submission-service\src\main\java\com\university\lms\submission\model\Submission.java" (
    echo [OK] Submission.java found
) else (
    echo [ERROR] Submission.java not found
)

if exist "submission-service\src\main\java\com\university\lms\submission\model\Project.java" (
    echo [OK] Project.java found
) else (
    echo [ERROR] Project.java not found
)

if exist "submission-service\src\main\java\com\university\lms\submission\repository\AssignmentRepository.java" (
    echo [OK] AssignmentRepository.java found
) else (
    echo [ERROR] AssignmentRepository.java not found
)

if exist "submission-service\src\main\java\com\university\lms\submission\repository\SubmissionRepository.java" (
    echo [OK] SubmissionRepository.java found
) else (
    echo [ERROR] SubmissionRepository.java not found
)

if exist "submission-service\src\main\java\com\university\lms\submission\repository\ProjectRepository.java" (
    echo [OK] ProjectRepository.java found
) else (
    echo [ERROR] ProjectRepository.java not found
)

if exist "submission-service\src\main\java\com\university\lms\submission\service\AssignmentService.java" (
    echo [OK] AssignmentService.java found
) else (
    echo [ERROR] AssignmentService.java not found
)

if exist "submission-service\src\main\java\com\university\lms\submission\service\SubmissionService.java" (
    echo [OK] SubmissionService.java found
) else (
    echo [ERROR] SubmissionService.java not found
)

if exist "submission-service\src\main\java\com\university\lms\submission\service\ProjectService.java" (
    echo [OK] ProjectService.java found
) else (
    echo [ERROR] ProjectService.java not found
)

if exist "submission-service\src\main\resources\templates\index.html" (
    echo [OK] Submission Service index.html found
) else (
    echo [ERROR] Submission Service index.html not found
)

if exist "submission-service\src\main\resources\templates\assignments.html" (
    echo [OK] assignments.html found
) else (
    echo [ERROR] assignments.html not found
)

if exist "submission-service\src\main\resources\templates\submissions.html" (
    echo [OK] submissions.html found
) else (
    echo [ERROR] submissions.html not found
)

if exist "submission-service\src\main\resources\templates\projects.html" (
    echo [OK] projects.html found
) else (
    echo [ERROR] projects.html not found
)

echo.
echo Checking test files...
if exist "user-service\src\test\java\com\university\lms\user\service\StudentServiceTest.java" (
    echo [OK] StudentServiceTest.java found
) else (
    echo [ERROR] StudentServiceTest.java not found
)

if exist "submission-service\src\test\java\com\university\lms\submission\controller\AssignmentControllerTest.java" (
    echo [OK] AssignmentControllerTest.java found
) else (
    echo [ERROR] AssignmentControllerTest.java not found
)

echo.
echo Checking configuration files...
if exist "user-service\src\main\resources\application.properties" (
    echo [OK] User Service application.properties found
) else (
    echo [ERROR] User Service application.properties not found
)

if exist "submission-service\src\main\resources\application.properties" (
    echo [OK] Submission Service application.properties found
) else (
    echo [ERROR] Submission Service application.properties not found
)

if exist "user-service\pom.xml" (
    echo [OK] User Service pom.xml found
) else (
    echo [ERROR] User Service pom.xml not found
)

if exist "submission-service\pom.xml" (
    echo [OK] Submission Service pom.xml found
) else (
    echo [ERROR] Submission Service pom.xml not found
)

if exist "pom.xml" (
    echo [OK] Root pom.xml found
) else (
    echo [ERROR] Root pom.xml not found
)

if exist "README.md" (
    echo [OK] README.md found
) else (
    echo [ERROR] README.md not found
)

if exist "SETUP.md" (
    echo [OK] SETUP.md found
) else (
    echo [ERROR] SETUP.md not found
)

if exist "FINAL_SUMMARY.md" (
    echo [OK] FINAL_SUMMARY.md found
) else (
    echo [ERROR] FINAL_SUMMARY.md not found
)

if exist "PROJECT_STRUCTURE.md" (
    echo [OK] PROJECT_STRUCTURE.md found
) else (
    echo [ERROR] PROJECT_STRUCTURE.md not found
)

if exist "run-services.bat" (
    echo [OK] run-services.bat found
) else (
    echo [ERROR] run-services.bat not found
)

if exist "run-services.sh" (
    echo [OK] run-services.sh found
) else (
    echo [ERROR] run-services.sh not found
)

echo.
echo Structure verification complete.