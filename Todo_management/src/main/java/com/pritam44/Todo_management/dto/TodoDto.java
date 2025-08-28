package com.pritam44.Todo_management.dto;

import java.time.LocalDateTime;

import org.springframework.stereotype.Component;

@Component
public class TodoDto {
    private Long id;
    private String title;
    private String description;
    private boolean completed;
    private LocalDateTime createdDate;
    private LocalDateTime dueDate;
    private String priority; // LOW, MEDIUM, HIGH
    private Long userId;     // if multi-user app

    // Constructors
    public TodoDto() {}

    public TodoDto(Long id, String title, String description, boolean completed,
                   LocalDateTime createdDate, LocalDateTime dueDate,
                   String priority, Long userId) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.completed = completed;
        this.createdDate = createdDate;
        this.dueDate = dueDate;
        this.priority = priority;
        this.userId = userId;
    }

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public boolean isCompleted() { return completed; }
    public void setCompleted(boolean completed) { this.completed = completed; }

    public LocalDateTime getCreatedDate() { return createdDate; }
    public void setCreatedDate(LocalDateTime createdDate) { this.createdDate = createdDate; }

    public LocalDateTime getDueDate() { return dueDate; }
    public void setDueDate(LocalDateTime dueDate) { this.dueDate = dueDate; }

    public String getPriority() { return priority; }
    public void setPriority(String priority) { this.priority = priority; }

    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
}
