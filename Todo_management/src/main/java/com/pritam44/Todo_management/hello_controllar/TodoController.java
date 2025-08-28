package com.pritam44.Todo_management.hello_controllar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pritam44.Todo_management.todoService.TodoServiceImpl;



@Controller
public class TodoController {
	@Autowired
	private TodoServiceImpl service ;

	@RequestMapping("manage-todo")
	public String todolist(ModelMap model){
		return "todopage";
	}
	
	
	

}
