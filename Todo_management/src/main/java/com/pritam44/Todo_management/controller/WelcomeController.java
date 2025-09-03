package com.pritam44.Todo_management.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WelcomeController {
	 
	@RequestMapping(value ="/" , method = RequestMethod.GET)
	public String app( ModelMap model) {
		model.put("userName",  getLoggedInUdserName());
		return "welcom" ;
	}
	
	private String getLoggedInUdserName() {
		Authentication authentication = SecurityContextHolder
				.getContext().getAuthentication();
		return authentication.getName();
	}
	
	

}
