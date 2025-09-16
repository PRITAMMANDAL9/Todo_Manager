package com.pritam44.Todo_management.todoService;
	import com.pritam44.Todo_management.entity.AppUser;
	import com.pritam44.Todo_management.repository.AppUserRepository;
	import org.springframework.security.crypto.password.PasswordEncoder;
	import org.springframework.stereotype.Service;

	@Service
	public class SignupService {

	    private final AppUserRepository userRepository;
	    private final PasswordEncoder passwordEncoder;

	    public SignupService(AppUserRepository userRepository, PasswordEncoder passwordEncoder) {
	        this.userRepository = userRepository;
	        this.passwordEncoder = passwordEncoder;
	    }

	    public AppUser registerUser(String username, String rawPassword) {
	        if (userRepository.findByUsername(username).isPresent()) {
	            throw new IllegalArgumentException("Username already exists");
	        }

	        String encodedPassword = passwordEncoder.encode(rawPassword);

	        AppUser newUser = new AppUser();
	        newUser.setUsername(username);
	        newUser.setPassword(encodedPassword);
	        newUser.setRoles("USER"); // default role
	        newUser.setEnabled(true);

	        return userRepository.save(newUser);
	    }
	}


