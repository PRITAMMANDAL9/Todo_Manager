package com.pritam44.Todo_management.security;


import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class BcryptGenerator implements CommandLineRunner {

    @Override
    public void run(String... args) {
        String rawPassword = ""; // change if needed
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String hashed = encoder.encode(rawPassword);

        System.out.println("===================================================");
        System.out.println("Raw Password     : " + rawPassword);
        System.out.println("BCrypt Encoded   : " + hashed);
        System.out.println("===================================================");
    }
}



