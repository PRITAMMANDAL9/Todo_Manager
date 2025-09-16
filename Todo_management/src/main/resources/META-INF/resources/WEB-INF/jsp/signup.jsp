<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>Sign Up • TODO Manager</title>
  <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/5.3.3/css/bootstrap.min.css'/>">
  <style>
    body { 
      display:flex; 
      align-items:center; 
      justify-content:center; 
      height:100vh; 
      background:linear-gradient(135deg, #22d3ee, #6366f1);
      margin:0; 
      font-family: "Segoe UI", Roboto, Arial, sans-serif;
    }
    .card { 
      max-width:460px; 
      width:100%; 
      padding:2rem; 
      background:#fff; 
      border-radius:16px; 
      box-shadow:0 8px 24px rgba(0,0,0,0.15); 
      animation: fadeIn 0.4s ease;
    }
    @keyframes fadeIn {
      from {opacity:0; transform:translateY(20px);}
      to {opacity:1; transform:translateY(0);}
    }
    .brand {
      text-align:center; 
      font-weight:700; 
      font-size:28px; 
      margin-bottom:20px;
      color:#22c55e;
    }
    .error { 
      color:#dc2626; 
      margin-bottom:12px; 
      font-size:0.9rem; 
      text-align:center;
    }
    .success { 
      color:green; 
      margin-bottom:12px; 
      font-size:0.9rem; 
      text-align:center;
    }
    .btn-primary {
      background:#22c55e; 
      border:none; 
      border-radius:10px; 
      padding:10px; 
      font-weight:600;
    }
    .btn-primary:hover {
      background:#16a34a;
    }
    .login-link { 
      display:block; 
      margin-top:18px; 
      text-align:center; 
      font-size:0.95rem;
    }
    .login-link a {
      color:#6366f1;
      font-weight:600;
      text-decoration:none;
    }
    .login-link a:hover {
      text-decoration:underline;
    }
  </style>
</head>
<body>
  <main class="card">
    <!-- Brand / Title -->
    <div class="brand">Create Your Account</div>

    <!-- Error / Success messages -->
    <c:if test="${param.error != null}">
      <div class="error" role="alert">Something went wrong. Try again.</div>
    </c:if>
    <c:if test="${param.success != null}">
      <div class="success" role="status">Account created successfully! Please login.</div>
    </c:if>

    <!-- Signup Form -->
    <form method="post" action="<c:url value='/signup'/>" autocomplete="on">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

      <div class="mb-3">
        <label for="username" class="form-label">Username</label>
        <input id="username" name="username" class="form-control" type="text" required autocomplete="username" />
      </div>

      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input id="password" name="password" class="form-control" type="password" required autocomplete="new-password" />
      </div>

      <div class="mb-3">
        <label for="confirmPassword" class="form-label">Confirm Password</label>
        <input id="confirmPassword" name="confirmPassword" class="form-control" type="password" required autocomplete="new-password" />
      </div>

      <button type="submit" class="btn btn-primary w-100">Create Account</button>
    </form>

    <!-- Back to login link -->
    <div class="login-link">
      <span>Already have an account?</span>
      <a href="<c:url value='/login'/>">Sign in</a>
    </div>
  </main>
</body>
</html>
