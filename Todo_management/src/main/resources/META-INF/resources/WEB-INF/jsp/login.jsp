<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>Login • TODO Manager</title>
  <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/5.3.3/css/bootstrap.min.css'/>">
  <style>
    body { display:flex; align-items:center; justify-content:center; height:100vh; background:#f9fafb; margin:0; }
    .card { max-width:420px; width:100%; padding:2rem; background:#fff; border-radius:12px; box-shadow:0 4px 24px rgba(0,0,0,0.05); }
    .error { color:#dc2626; margin-bottom:8px; }
    .success { color:green; margin-bottom:8px; }
  </style>
</head>
<body>
  <main class="card">
    <div style="text-align:center; font-weight:700; font-size:22px; margin-bottom:12px">TODO Manager</div>

    <c:if test="${param.error != null}">
      <div class="error" role="alert">Invalid username or password.</div>
    </c:if>
    <c:if test="${param.logout != null}">
      <div class="success" role="status">You have been logged out.</div>
    </c:if>

    <form method="post" action="<c:url value='/do-login'/>" autocomplete="on">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <div class="mb-3">
        <label for="username" class="form-label">Username</label>
        <input id="username" name="username" class="form-control" type="text" required autocomplete="username" />
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input id="password" name="password" class="form-control" type="password" required autocomplete="current-password" />
      </div>
      <button type="submit" class="btn btn-primary w-100">Sign in</button>
    </form>
  </main>
</body>
</html>
