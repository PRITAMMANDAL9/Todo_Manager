package com.pritam44.Todo_management.todoService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pritam44.Todo_management.dto.TodoDto;

@Service
public interface TodoService {	
	    // 🔹 Create a new TODO
	    TodoDto createTodo(TodoDto todoDto);

	    // 🔹 Get all TODOs for a user
	    List<TodoDto> getAllTodos();

	    // 🔹 Get a single TODO by ID
	    TodoDto getTodoById(Long id);

	    // 🔹 Update an existing TODO
	    TodoDto updateTodo(Long id, TodoDto todoDto);

	    // 🔹 Delete a TODO by ID
	    void deleteTodo(Long id);

	    // 🔹 Mark a TODO as completed
	    TodoDto markAsCompleted(Long id);

	    // 🔹 Find TODOs by status (Pending, In Progress, Completed)
	    List<TodoDto> getTodosByStatus(String status);

	    // 🔹 Find TODOs by priority (Low, Medium, High)
	    List<TodoDto> getTodosByPriority(String priority);

	    // 🔹 Find overdue TODOs (based on dueDate)
	    List<TodoDto> getOverdueTodos();
	}



