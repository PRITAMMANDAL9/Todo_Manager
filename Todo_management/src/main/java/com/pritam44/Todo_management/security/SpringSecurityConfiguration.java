package com.pritam44.Todo_management.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SpringSecurityConfiguration {

    private final DatabaseUserDetailsService userDetailsService;

    public SpringSecurityConfiguration(DatabaseUserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider daoAuthProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService);
        provider.setPasswordEncoder(passwordEncoder());
        return provider;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .authenticationProvider(daoAuthProvider())
            .authorizeHttpRequests(auth -> auth
                .requestMatchers(
                    "/login", "/do-login", "/logout", "/signup",       // auth endpoints
                    "/css/**", "/js/**", "/images/**", "/webjars/**",
                    "/WEB-INF/jsp/**"                        // ✅ allow JSP views
                ).permitAll()
                .anyRequest().authenticated()
            )
            .formLogin(form -> form
                .loginPage("/login")                        // GET -> show login.jsp
                .loginProcessingUrl("/do-login")            // POST -> handled by Spring Security
                .defaultSuccessUrl("/welcome", true)        // ✅ fixed path
                .failureUrl("/login?error=true")
                .permitAll()
            )
            .logout(logout -> logout
            	    .logoutUrl("/logout")
            	    .logoutSuccessUrl("/logout-success")  // redirect to JSP page
            	    .permitAll()
            	);

        return http.build();
    }
}
