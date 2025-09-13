package com.pritam44.Todo_management.security;
	import java.util.Arrays;
	import java.util.Collection;
	import java.util.List;
	import java.util.stream.Collectors;

	import com.pritam44.Todo_management.entity.AppUser;
	import com.pritam44.Todo_management.repository.AppUserRepository;

	import org.springframework.security.core.GrantedAuthority;
	import org.springframework.security.core.authority.SimpleGrantedAuthority;
	import org.springframework.security.core.userdetails.*;
	import org.springframework.stereotype.Service;

	@Service
	public class DatabaseUserDetailsService implements UserDetailsService {

	    private final AppUserRepository userRepository;

	    public DatabaseUserDetailsService(AppUserRepository userRepository) {
	        this.userRepository = userRepository;
	    }

	    @Override
	    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	        AppUser appUser = userRepository.findByUsername(username)
	                .orElseThrow(() -> new UsernameNotFoundException("User not found: " + username));

	        return new User(appUser.getUsername(),
	                        appUser.getPassword(),
	                        appUser.isEnabled(),
	                        true,  // accountNonExpired
	                        true,  // credentialsNonExpired
	                        true,  // accountNonLocked
	                        toAuthorities(appUser.getRoles()));
	    }

	    private Collection<? extends GrantedAuthority> toAuthorities(String rolesCsv) {
	        if (rolesCsv == null || rolesCsv.isBlank()) return List.of();
	        return Arrays.stream(rolesCsv.split(","))
	                .map(String::trim)
	                // Accept role names with or without ROLE_ prefix; ensure SimpleGrantedAuthority expects ROLE_*
	                .map(r -> r.startsWith("ROLE_") ? r : "ROLE_" + r)
	                .map(SimpleGrantedAuthority::new)
	                .collect(Collectors.toList());
	    }
	}


