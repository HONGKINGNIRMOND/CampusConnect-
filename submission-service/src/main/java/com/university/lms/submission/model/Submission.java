package com.university.lms.submission.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDateTime;

@Entity
@Table(name = "submissions")
public class Submission {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "Student ID is required")
    @Column(nullable = false)
    private Long studentId;

    @NotNull(message = "Assignment ID is required")
    @Column(nullable = false)
    private Long assignmentId;

    @NotBlank(message = "File URL is required")
    @Column(nullable = false)
    private String fileUrl;

    @NotNull(message = "Submitted date is required")
    @Column(nullable = false)
    private LocalDateTime submittedDate;

    @NotBlank(message = "Status is required")
    @Column(nullable = false)
    private String status; // e.g., "SUBMITTED", "GRADED", "LATE"

    // Constructors
    public Submission() {
    }

    public Submission(Long studentId, Long assignmentId, String fileUrl, LocalDateTime submittedDate, String status) {
        this.studentId = studentId;
        this.assignmentId = assignmentId;
        this.fileUrl = fileUrl;
        this.submittedDate = submittedDate;
        this.status = status;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public Long getAssignmentId() {
        return assignmentId;
    }

    public void setAssignmentId(Long assignmentId) {
        this.assignmentId = assignmentId;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public LocalDateTime getSubmittedDate() {
        return submittedDate;
    }

    public void setSubmittedDate(LocalDateTime submittedDate) {
        this.submittedDate = submittedDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}