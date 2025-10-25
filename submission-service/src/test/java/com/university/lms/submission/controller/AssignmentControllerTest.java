package com.university.lms.submission.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.university.lms.submission.model.Assignment;
import com.university.lms.submission.service.AssignmentService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.Optional;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(AssignmentController.class)
class AssignmentControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private AssignmentService assignmentService;

    @Autowired
    private ObjectMapper objectMapper;

    @Test
    void getAllAssignments() throws Exception {
        // Given
        Assignment assignment1 = new Assignment("Assignment 1", "Description 1", LocalDate.now().plusDays(7), 1L);
        assignment1.setId(1L);
        Assignment assignment2 = new Assignment("Assignment 2", "Description 2", LocalDate.now().plusDays(14), 2L);
        assignment2.setId(2L);

        when(assignmentService.getAllAssignments()).thenReturn(Arrays.asList(assignment1, assignment2));

        // When & Then
        mockMvc.perform(get("/api/assignments")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].id").value(1L))
                .andExpect(jsonPath("$[0].title").value("Assignment 1"))
                .andExpect(jsonPath("$[1].id").value(2L))
                .andExpect(jsonPath("$[1].title").value("Assignment 2"));
    }

    @Test
    void getAssignmentById() throws Exception {
        // Given
        Assignment assignment = new Assignment("Assignment 1", "Description 1", LocalDate.now().plusDays(7), 1L);
        assignment.setId(1L);

        when(assignmentService.getAssignmentById(1L)).thenReturn(Optional.of(assignment));

        // When & Then
        mockMvc.perform(get("/api/assignments/1")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id").value(1L))
                .andExpect(jsonPath("$.title").value("Assignment 1"));
    }

    @Test
    void createAssignment() throws Exception {
        // Given
        Assignment assignment = new Assignment("New Assignment", "New Description", LocalDate.now().plusDays(7), 1L);
        assignment.setId(1L);

        when(assignmentService.saveAssignment(any(Assignment.class))).thenReturn(assignment);

        // When & Then
        mockMvc.perform(post("/api/assignments")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(assignment)))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.id").value(1L))
                .andExpect(jsonPath("$.title").value("New Assignment"));
    }

    @Test
    void updateAssignment() throws Exception {
        // Given
        Assignment assignment = new Assignment("Updated Assignment", "Updated Description", LocalDate.now().plusDays(7),
                1L);
        assignment.setId(1L);

        when(assignmentService.getAssignmentById(1L)).thenReturn(Optional.of(assignment));
        when(assignmentService.saveAssignment(any(Assignment.class))).thenReturn(assignment);

        // When & Then
        mockMvc.perform(put("/api/assignments/1")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(assignment)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id").value(1L))
                .andExpect(jsonPath("$.title").value("Updated Assignment"));
    }
}