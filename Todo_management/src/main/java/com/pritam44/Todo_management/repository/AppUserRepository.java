package com.pritam44.Todo_management.repository;

	import java.util.Optional;

	import org.springframework.data.jpa.repository.JpaRepository;
	import com.pritam44.Todo_management.entity.AppUser;

	public interface AppUserRepository extends JpaRepository<AppUser, Long> {
	    Optional<AppUser> findByUsername(String username);
	}

