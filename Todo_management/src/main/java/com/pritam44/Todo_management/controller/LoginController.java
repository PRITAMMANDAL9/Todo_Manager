package com.pritam44.Todo_management.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String loginPage(Authentication authentication) {
        if (authentication != null && authentication.isAuthenticated()
            && !(authentication instanceof AnonymousAuthenticationToken)) {
            return "redirect:/welcome";
        }
        return "login";
    }
    
        @GetMapping("/logout-success")
        public String logoutPage() {
            return "logout"; // maps to logout.jsp
        }
        
    }


