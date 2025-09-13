package com.pritam44.Todo_management.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;

import org.springframework.dao.DataAccessException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pritam44.Todo_management.entity.Todo;
import com.pritam44.Todo_management.repository.TodoRepository;

@Controller
public class TodoController {
	
	
    private TodoRepository todoRepository;

    public TodoController(TodoRepository todoRepository) {
		super();
		this.todoRepository = todoRepository;
	}

	@RequestMapping("manage-todo")
    public String todolist(ModelMap model) {
        model.put("UserName", getLoggedInUdserName());
        model.addAttribute("todos", todoRepository.findAll());
        return "todopage";
    }

	@PostMapping("/todos/add")
	public String addTodo(@RequestParam String title,
	                      @RequestParam(required = false) String description,
	                      @RequestParam(required = false) String dueDate,   // <-- String now
	                      @RequestParam(defaultValue = "LOW") String priority,
	                      RedirectAttributes redirectAttrs) {

	    if (title == null || title.trim().isEmpty()) {
	        redirectAttrs.addFlashAttribute("error", "Title is required.");
	        return "redirect:/manage-todo";
	    }

	    Todo t = new Todo();
	    t.setTitle(title.trim());
	    t.setDescription(description);
	    t.setPriority(priority);
	    t.setCompleted(false);
	    t.setUserName(getLoggedInUdserName());

	    try {
	        if (dueDate != null && !dueDate.isBlank()) {
	            // handle both date-only and datetime-local
	            if (dueDate.contains("T")) {
	                // parse as LocalDateTime (e.g. 2025-09-05T14:30 or 2025-09-05T14:30:00)
	                t.setDueDate(LocalDateTime.parse(dueDate));
	            } else {
	                // parse as LocalDate (yyyy-MM-dd) -> convert to start of day
	                LocalDate ld = LocalDate.parse(dueDate);
	                t.setDueDate(ld.atStartOfDay());
	            }
	        } else {
	            t.setDueDate(null);
	        }

	        todoRepository.save(t);
	        redirectAttrs.addFlashAttribute("success", "Todo added.");
	    } catch (DateTimeParseException dtpe) {
	        redirectAttrs.addFlashAttribute("error", "Invalid due date format.");
	    } catch (DataAccessException dex) {
	        redirectAttrs.addFlashAttribute("error", "Failed to save todo: " + dex.getRootCause().getMessage());
	    }

	    return "redirect:/manage-todo";
	}

    @PostMapping("/todos/{id}/toggle")
    public String toggleComplete(@PathVariable Long id, RedirectAttributes redirectAttrs) {
        todoRepository.findById(id).ifPresent(todo -> {
            todo.setCompleted(!todo.isCompleted());
            todoRepository.save(todo);
        });
        return "redirect:/manage-todo";
    }

    @PostMapping("/todos/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes redirectAttrs) {
        try {
            todoRepository.deleteById(id);
            redirectAttrs.addFlashAttribute("success", "Todo deleted.");
        } catch (DataAccessException dex) {
            redirectAttrs.addFlashAttribute("error", "Unable to delete todo: " + dex.getRootCause().getMessage());
        }
        return "redirect:/manage-todo";
    }

    @PostMapping("/todos/{id}/edit")
    public String edit(@PathVariable Long id,
                       @RequestParam String title,
                       @RequestParam(required = false) String description,
                       @RequestParam(required = false) String dueDate,    // <-- String now
                       @RequestParam(defaultValue = "LOW") String priority,
                       RedirectAttributes redirectAttrs) {

        if (title == null || title.trim().isEmpty()) {
            redirectAttrs.addFlashAttribute("error", "Title is required.");
            return "redirect:/manage-todo";
        }

        try {
            todoRepository.findById(id).ifPresent(todo -> {
                todo.setTitle(title.trim());
                todo.setDescription(description);
                todo.setPriority(priority);

                if (dueDate != null && !dueDate.isBlank()) {
                    if (dueDate.contains("T")) {
                        todo.setDueDate(LocalDateTime.parse(dueDate));
                    } else {
                        todo.setDueDate(LocalDate.parse(dueDate).atStartOfDay());
                    }
                } else {
                    todo.setDueDate(null);
                }

                todoRepository.save(todo);
            });
            redirectAttrs.addFlashAttribute("success", "Todo updated.");
        } catch (DateTimeParseException dtpe) {
            redirectAttrs.addFlashAttribute("error", "Invalid due date format.");
        } catch (DataAccessException dex) {
            redirectAttrs.addFlashAttribute("error", "Failed to update todo: " + dex.getRootCause().getMessage());
        }

        return "redirect:/manage-todo";
    }

    private String getLoggedInUdserName() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication.getName();
    }
}

