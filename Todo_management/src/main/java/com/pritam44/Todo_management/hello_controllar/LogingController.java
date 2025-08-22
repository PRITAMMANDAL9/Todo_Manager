package com.pritam44.Todo_management.hello_controllar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LogingController {
	@Autowired
	private Athentication athentication;
	 
	@RequestMapping(value ="login" , method = RequestMethod.GET)
	public String applogin() {
		return "loging" ;
	}
	
	@RequestMapping( value = "login", method = RequestMethod.POST)
	public String welcomPage(@RequestParam String email , @RequestParam String password, ModelMap model) {
		if(athentication.athenticate(email,password)) {
		model.put("email", email);
		
		return "welcom" ;
		}
		model.put("errormassage","Incorrect email or password. Please try again.");
		return "loging";
	}
	

}
