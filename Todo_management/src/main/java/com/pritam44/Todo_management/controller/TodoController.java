package com.pritam44.Todo_management.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class TodoController {


	@RequestMapping("manage-todo")
	public String todolist(ModelMap model){
		model.put("UserName",getLoggedInUdserName());
		return "todopage";
	}
	
	private String getLoggedInUdserName() {
		Authentication authentication = SecurityContextHolder
				.getContext().getAuthentication();
		return authentication.getName();
	}
	
	
	

}
