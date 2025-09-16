<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>Logout • TODO Manager</title>
  <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/5.3.3/css/bootstrap.min.css'/>">
  <style>
    body {
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      background:#f9fafb;
      margin:0;
    }
    .card {
      max-width:420px;
      width:100%;
      padding:2rem;
      background:#fff;
      border-radius:12px;
      box-shadow:0 4px 24px rgba(0,0,0,0.05);
      text-align:center;
    }
    .btn {
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <main class="card">
    <h2>You have been logged out</h2>
    <p class="text-muted">Thanks for using TODO Manager. See you again soon!</p>

    <a href="<c:url value='/login'/>" class="btn btn-primary w-100">Login Again</a>
  </main>
</body>
</html>
