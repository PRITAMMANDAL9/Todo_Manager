package com.pritam44.Todo_management.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pritam44.Todo_management.entity.Todo;

public interface TodoRepository extends JpaRepository<Todo, Long> {
	  // Get todos by completed status (true/false)
    List<Todo> findByCompleted(boolean completed);

    // Get todos by priority (LOW, MEDIUM, HIGH)
    List<Todo> findByPriorityIgnoreCase(String priority);

    // Get overdue todos (dueDate < now and not completed)
    List<Todo> findByDueDateBeforeAndCompletedFalse(LocalDateTime now);


}
