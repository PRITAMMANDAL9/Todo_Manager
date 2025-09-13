package com.pritam44.Todo_management.entity;

	import jakarta.persistence.*;
	import java.util.Objects;

	@Entity
	@Table(name = "app_user")
	public class AppUser {

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    @Column(nullable = false, unique = true, length = 100)
	    private String username;

	    // store the encoded password
	    @Column(nullable = false)
	    private String password;

	    // store roles as a comma separated string, e.g. "ROLE_USER,ROLE_ADMIN"
	    @Column(nullable = false)
	    private String roles;

	    @Column(nullable = false)
	    private boolean enabled = true;

	    public AppUser() {}

	    public AppUser(String username, String password, String roles) {
	        this.username = username;
	        this.password = password;
	        this.roles = roles;
	        this.enabled = true;
	    }

	    // getters / setters

	    public Long getId() { return id; }
	    public void setId(Long id) { this.id = id; }

	    public String getUsername() { return username; }
	    public void setUsername(String username) { this.username = username; }

	    public String getPassword() { return password; }
	    public void setPassword(String password) { this.password = password; }

	    public String getRoles() { return roles; }
	    public void setRoles(String roles) { this.roles = roles; }

	    public boolean isEnabled() { return enabled; }
	    public void setEnabled(boolean enabled) { this.enabled = enabled; }

	    @Override
	    public boolean equals(Object o) {
	        if (this == o) return true;
	        if (!(o instanceof AppUser)) return false;
	        AppUser other = (AppUser) o;
	        return Objects.equals(id, other.id) && Objects.equals(username, other.username);
	    }

	    @Override
	    public int hashCode() {
	        return Objects.hash(id, username);
	    }
	}


