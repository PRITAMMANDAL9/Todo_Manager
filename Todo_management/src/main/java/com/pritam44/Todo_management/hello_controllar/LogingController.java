package com.pritam44.Todo_management.hello_controllar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogingController {
	
	@RequestMapping("login")
	public String applogin() {
		return "loging" ;
	}
	

}
