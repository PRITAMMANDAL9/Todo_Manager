package com.pritam44.Todo_management.todoService;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import com.pritam44.Todo_management.Exception.InternalServiceException;
//import com.pritam44.Todo_management.Exception.InvalidTodoDataException;
//import com.pritam44.Todo_management.Exception.TodoNotFoundException;
import com.pritam44.Todo_management.dto.TodoDto;
//import com.pritam44.Todo_management.entity.Todo;
//import com.pritam44.Todo_management.mapperUtil.MapperUtil;
//import com.pritam44.Todo_management.repository.TodoRepositoryImpl;
//
//
@Service
public class TodoServiceImpl  {
	
	
	
//	@Service
//	public class TodoServiceImpl implements TodoService {
//	
//	private final TodoRepositoryImpl todoRepository;
//
//    @Autowired
//    public TodoServiceImpl(TodoRepositoryImpl todoRepository) {
//        this.todoRepository = todoRepository;
//    }
//
//    @Override
//    public TodoDto createTodo(TodoDto todoDto) {
//        if (todoDto.getTitle() == null || todoDto.getTitle().trim().isEmpty()) {
//            throw new InvalidTodoDataException("Title cannot be null or empty.");
//        }
//
//        try {
//            Todo todo = MapperUtil.toEntity(todoDto);
//            todo.setCreatedDate(LocalDateTime.now());
//            Todo savedTodo = todoRepository.save(todo);
//            return MapperUtil.toDto(savedTodo);
//        } catch (Exception e) {
//            throw new InternalServiceException("Failed to create Todo: " + e.getMessage());
//        }
//    }
//
//    @Override
//    public List<TodoDto> getAllTodos() {
//        try {
//            return todoRepository.findAll()
//                    .stream()
//                    .map(MapperUtil::toDto)
//                    .collect(Collectors.toList());
//        } catch (Exception e) {
//            throw new InternalServiceException("Failed to fetch all Todos: " + e.getMessage());
//        }
//    }
//
//    @Override
//    public TodoDto getTodoById(Long id) {
//        Todo todo = todoRepository.findById(id)
//                .orElseThrow(() -> new TodoNotFoundException("Todo not found with id: " + id));
//        return MapperUtil.toDto(todo);
//    }
//
//    @Override
//    public TodoDto updateTodo(Long id, TodoDto todoDto) {
//        Todo existingTodo = todoRepository.findById(id)
//                .orElseThrow(() -> new TodoNotFoundException("Cannot update. Todo not found with id: " + id));
//
//        if (todoDto.getTitle() == null || todoDto.getTitle().trim().isEmpty()) {
//            throw new InvalidTodoDataException("Title cannot be null or empty.");
//        }
//
//        try {
//            existingTodo.setTitle(todoDto.getTitle());
//            existingTodo.setDescription(todoDto.getDescription());
//            existingTodo.setCompleted(todoDto.isCompleted());
//            existingTodo.setDueDate(todoDto.getDueDate());
//            existingTodo.setPriority(todoDto.getPriority());
//            existingTodo.setUserId(todoDto.getUserId());
//
//            Todo updatedTodo = todoRepository.save(existingTodo);
//            return MapperUtil.toDto(updatedTodo);
//        } catch (Exception e) {
//            throw new InternalServiceException("Failed to update Todo with id: " + id + ". " + e.getMessage());
//        }
//    }
//
//    @Override
//    public void deleteTodo(Long id) {
//        Todo todo = todoRepository.findById(id)
//                .orElseThrow(() -> new TodoNotFoundException("Cannot delete. Todo not found with id: " + id));
//        try {
//            todoRepository.delete(todo);
//        } catch (Exception e) {
//            throw new InternalServiceException("Failed to delete Todo with id: " + id + ". " + e.getMessage());
//        }
//    }
//
//    @Override
//    public TodoDto markAsCompleted(Long id) {
//        Todo todo = todoRepository.findById(id)
//                .orElseThrow(() -> new TodoNotFoundException("Cannot mark completed. Todo not found with id: " + id));
//
//        try {
//            todo.setCompleted(true);
//            Todo updatedTodo = todoRepository.save(todo);
//            return MapperUtil.toDto(updatedTodo);
//        } catch (Exception e) {
//            throw new InternalServiceException("Failed to mark Todo as completed with id: " + id + ". " + e.getMessage());
//        }
//    }
//
//    @Override
//    public List<TodoDto> getTodosByStatus(String status) {
//        try {
//            boolean isCompleted = "completed".equalsIgnoreCase(status);
//            return todoRepository.findByCompleted(isCompleted)
//                    .stream()
//                    .map(MapperUtil::toDto)
//                    .collect(Collectors.toList());
//        } catch (Exception e) {
//            throw new InternalServiceException("Failed to fetch Todos by status: " + e.getMessage());
//        }
//    }
//
//    @Override
//    public List<TodoDto> getTodosByPriority(String priority) {
//        try {
//            return todoRepository.findByPriorityIgnoreCase(priority)
//                    .stream()
//                    .map(MapperUtil::toDto)
//                    .collect(Collectors.toList());
//        } catch (Exception e) {
//            throw new InternalServiceException("Failed to fetch Todos by priority: " + e.getMessage());
//        }
//    }
//
//    @Override
//    public List<TodoDto> getOverdueTodos() {
//        try {
//            LocalDateTime now = LocalDateTime.now();
//            return todoRepository.findByDueDateBeforeAndCompletedFalse(now)
//                    .stream()
//                    .map(MapperUtil::toDto)
//                    .collect(Collectors.toList());
//        } catch (Exception e) {
//            throw new InternalServiceException("Failed to fetch overdue Todos: " + e.getMessage());
//        }
//    }
//	
//    
//
}
