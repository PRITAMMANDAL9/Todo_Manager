package com.pritam44.Todo_management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pritam44.Todo_management.entity.AppUser;
import com.pritam44.Todo_management.todoService.SignupService;

	@Controller
	public class SignupController {

	    private final SignupService signupService;

	    public SignupController(SignupService signupService) {
	        this.signupService = signupService;
	    }

	    // Show signup page
	    @GetMapping("/signup")
	    public String signupPage() {
	        return "signup";
	    }

	    // Handle signup form submission
	    @PostMapping("/signup")
	    public String processSignup(
	            @RequestParam String username,
	            @RequestParam String password,
	            @RequestParam String confirmPassword,
	            RedirectAttributes redirectAttributes) {

	        if (!password.equals(confirmPassword)) {
	            redirectAttributes.addAttribute("error", "Passwords do not match");
	            return "redirect:/signup?error";
	        }

	        try {
	            AppUser newUser = signupService.registerUser(username, password);
	            redirectAttributes.addAttribute("success", "true");
	            return "redirect:/login?signup=success";
	        } catch (IllegalArgumentException e) {
	            redirectAttributes.addAttribute("error", e.getMessage());
	            return "redirect:/signup?error";
	        }
	    }
	}


