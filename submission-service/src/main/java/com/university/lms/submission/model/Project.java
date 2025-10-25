package com.university.lms.submission.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;

@Entity
@Table(name = "projects")
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Title is required")
    @Column(nullable = false)
    private String title;

    @NotBlank(message = "Description is required")
    @Column(nullable = false, length = 1000)
    private String description;

    @NotNull(message = "Faculty ID is required")
    @Column(nullable = false)
    private Long facultyId;

    @NotBlank(message = "Progress status is required")
    @Column(nullable = false)
    private String progressStatus; // e.g., "NOT_STARTED", "IN_PROGRESS", "COMPLETED"

    @NotNull(message = "Deadline is required")
    @Column(nullable = false)
    private LocalDate deadline;

    // Constructors
    public Project() {
    }

    public Project(String title, String description, Long facultyId, String progressStatus, LocalDate deadline) {
        this.title = title;
        this.description = description;
        this.facultyId = facultyId;
        this.progressStatus = progressStatus;
        this.deadline = deadline;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(Long facultyId) {
        this.facultyId = facultyId;
    }

    public String getProgressStatus() {
        return progressStatus;
    }

    public void setProgressStatus(String progressStatus) {
        this.progressStatus = progressStatus;
    }

    public LocalDate getDeadline() {
        return deadline;
    }

    public void setDeadline(LocalDate deadline) {
        this.deadline = deadline;
    }
}