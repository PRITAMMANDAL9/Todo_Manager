# ✅ Todo Management App

A **Spring Boot + JSP + Spring Security** based web application for managing todos.  
It allows users to **sign up, log in, create, update, complete, and delete tasks** with a clean Bootstrap-powered UI.  

---

## ✨ Features

- 🔐 **Authentication & Authorization**  
  - User registration (signup) and secure login with Spring Security  
  - Passwords stored with BCrypt hashing  

- 📋 **Todo Management**  
  - Create, update, delete, and mark todos as complete/incomplete  
  - Set priority (Low, Medium, High) and due dates  
  - View list of all todos  

- 🎨 **UI/UX**  
  - JSP views styled with Bootstrap 5  
  - Responsive and professional UI for login, signup, welcome, and todo management pages  

- 🗄 **Persistence**  
  - MySQL database with JPA/Hibernate  
  - Automatic schema creation (`spring.jpa.hibernate.ddl-auto=update`)  

---

## 🛠 Tech Stack

- **Backend:** Spring Boot 3, Spring MVC, Spring Data JPA, Spring Security  
- **Frontend:** JSP, JSTL, Bootstrap 5 (via WebJars)  
- **Database:** MySQL (H2 can be used for testing)  
- **Build Tool:** Maven  

---

## 📂 Project Structure
Todo_management/
├── src/main/java/com/pritam44/Todo_management/
│ ├── controller/ # Web controllers (Login, Welcome, Todo)
│ ├── entity/ # JPA entities (AppUser, Todo)
│ ├── repository/ # Spring Data JPA repositories
│ ├── security/ # Security config & UserDetailsService
│ └── TodoManagementApplication.java
│
├── src/main/resources/
│ ├── application.properties # DB and app configs
│ └── META-INF/resources/WEB-INF/jsp/ # JSP views
│
├── screenshots/ # 📸 screenshots for documentation
├── pom.xml
└── README.md

---

## ⚡ Getting Started

### Prerequisites
- Java 21+
- Maven 3.8+
- MySQL 8+ running locally

### Setup

1. **Clone the repo**
   ```bash
   git clone https://github.com/<your-username>/Todo_management.git
   cd Todo_management
## Configure Database

Create a MySQL database:
CREATE DATABASE todos;
CREATE USER 'todos_user'@'%' IDENTIFIED BY 'dummytodos';
GRANT ALL PRIVILEGES ON todos.* TO 'todos_user'@'%';
FLUSH PRIVILEGES;

## Build & Run
mvn clean install
mvn spring-boot:run

## Access the app
Open http://localhost:8080/login

## Default User (for testing)
Insert a test user into the app_user table:
INSERT INTO app_user (username, password, roles, enabled)
VALUES (
  'pritam',
  '$2a$10$FpyL5cweYjuKNOz79VJrEe6p8UkjVgb5dz71I.FQfbtZq.mFwWY5K', -- "pritam@123"
  'USER',
  TRUE
);
Then login with:
Username: pritam
Password: pritam@123

## 🚀 Future Enhancements

Add categories/tags for todos
Support file attachments per todo
REST API for mobile integration
Dark mode UI
