package com.pritam44.Todo_management.security;

import java.util.function.Function;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SpringSecurityConfiguration {
	
	@Bean
	public InMemoryUserDetailsManager configureUserDetails() {
		
		UserDetails userDetails1 = createNewUser("pritam", "pritam123");
		UserDetails userDetails2 = createNewUser("sppritam", "pritam");
		
		return new InMemoryUserDetailsManager(userDetails1,userDetails2);
		
	}
	private UserDetails createNewUser(String username, String password) {
		Function<String , String > passwordEncoder
		= input -> passwordEncoder().encode(input);
		UserDetails userDetails = User.builder()
			    .username(username)   
                .passwordEncoder(passwordEncoder)
                .password(password)
                .roles("USER", "ADMIN")
                .build();
		return userDetails;
	}
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.authorizeHttpRequests(auth -> auth.anyRequest().authenticated());
		 http .formLogin(form -> form    
		            .permitAll() );
		        http.csrf(csrf -> csrf.disable()); 
		        http.headers(headers -> headers
		            .frameOptions(frame -> frame.disable()) 
		        );
		return http.build();
		
	}

}
