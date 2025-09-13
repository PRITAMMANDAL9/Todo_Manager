package com.pritam44.Todo_management.security;


import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class GenerateBcrypt {
    public static void main(String[] args) {
        //Run this to GenerateBcrypt pass -  mvn clean compile "exec:java" "-Dexec.mainClass=com.pritam44.Todo_management.security.GenerateBcr
        String rawPassword = "pritam@123";

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String hashed = encoder.encode(rawPassword);

        System.out.println("Raw: " + rawPassword);
        System.out.println("BCrypt: " + hashed);
    }
}



