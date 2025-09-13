package com.pritam44.Todo_management.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WelcomeController {

    @GetMapping("/welcome")
    public String app(ModelMap model) {
        model.put("userName", getLoggedInUdserName());
        return "welcome";   
    }

    private String getLoggedInUdserName() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication != null ? authentication.getName() : "anonymous";
    }
}
