package com.pritam44.Todo_management.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;

@Entity
@Table(name = "todos")
public class Todo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false) // title is required
    private String title;

    @Column(length = 1000) // description is optional, with max length
    private String description;

    @Column(nullable = false)
    private boolean completed = false;

    @Column(nullable = false, updatable = false)
    private LocalDateTime createdDate;

    private LocalDateTime dueDate;

    @Column(length = 20)
    private String priority; // LOW, MEDIUM, HIGH

    private Long userId; // optional, if multi-user support

    // Constructors
    public Todo() {}

    public Todo(String title, String description, boolean completed,
                LocalDateTime createdDate, LocalDateTime dueDate,
                String priority, Long userId) {
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

    @PrePersist
    protected void onCreate() {
        this.createdDate = LocalDateTime.now();
    }
}

