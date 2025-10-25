package com.university.lms.user.service;

import com.university.lms.user.model.Student;
import com.university.lms.user.repository.StudentRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

class StudentServiceTest {

    @Mock
    private StudentRepository studentRepository;

    @InjectMocks
    private StudentService studentService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void getAllStudents() {
        // Given
        List<Student> students = Arrays.asList(
                new Student("John Doe", "john@example.com", "Computer Science"),
                new Student("Jane Smith", "jane@example.com", "Mathematics"));
        when(studentRepository.findAll()).thenReturn(students);

        // When
        List<Student> result = studentService.getAllStudents();

        // Then
        assertEquals(2, result.size());
        assertEquals("John Doe", result.get(0).getName());
        assertEquals("Jane Smith", result.get(1).getName());
        verify(studentRepository, times(1)).findAll();
    }

    @Test
    void getStudentById() {
        // Given
        Student student = new Student("John Doe", "john@example.com", "Computer Science");
        student.setId(1L);
        when(studentRepository.findById(1L)).thenReturn(Optional.of(student));

        // When
        Optional<Student> result = studentService.getStudentById(1L);

        // Then
        assertTrue(result.isPresent());
        assertEquals("John Doe", result.get().getName());
        verify(studentRepository, times(1)).findById(1L);
    }

    @Test
    void saveStudent() {
        // Given
        Student student = new Student("John Doe", "john@example.com", "Computer Science");
        when(studentRepository.save(any(Student.class))).thenReturn(student);

        // When
        Student result = studentService.saveStudent(student);

        // Then
        assertNotNull(result);
        assertEquals("John Doe", result.getName());
        verify(studentRepository, times(1)).save(student);
    }

    @Test
    void deleteStudent() {
        // Given
        Long studentId = 1L;
        doNothing().when(studentRepository).deleteById(studentId);

        // When
        studentService.deleteStudent(studentId);

        // Then
        verify(studentRepository, times(1)).deleteById(studentId);
    }
}