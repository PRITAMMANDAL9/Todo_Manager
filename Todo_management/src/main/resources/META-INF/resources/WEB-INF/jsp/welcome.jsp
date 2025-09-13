<%@ include file ="common/header.jspf" %>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Welcome • TODO Manager</title>
  <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/5.3.3/css/bootstrap.min.css'/>">
  <style>
    :root {
      --bg: #ffffff;   /* White background */
      --card: #f9fafb; /* Soft gray card */
      --muted: #6b7280;
      --text: #1f2937;
      --primary: #6366f1;
      --primary-600: #4f46e5;
    }

    body {
      margin: 0;
      font-family: Inter, system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial, "Apple Color Emoji", "Segoe UI Emoji";
      background: var(--bg);
      color: var(--text);
      display: grid;
      place-items: center;
      padding: 24px;
    }

    .card {
      width: 100%;
      max-width: 420px;
      background: var(--card);
      border: 1px solid #e5e7eb;
      border-radius: 20px;
      padding: 28px;
      box-shadow: 0 8px 24px rgba(0,0,0,.08);
      margin-top: 80px; /* pushes below navbar */
    }

    .brand {
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 20px;
    }

    /* Stylish TM Logo */
    .brand__logo {
      width: 48px; 
      height: 48px;
      display: grid; 
      place-items: center;
      border-radius: 12px;
      background: conic-gradient(from 180deg at 50% 50%, #22d3ee, #6366f1 40%, #22c55e 75%, #22d3ee);
      color: white; 
      font-weight: 800;
      font-size: 18px;
      font-family: "Segoe UI", sans-serif;
      letter-spacing: -0.5px;
      text-shadow: 0 1px 2px rgba(0,0,0,.25);
    }

    .btn {
      margin-top: 20px;
      padding: 12px 24px;
      font-size: 1rem;
      font-weight: 600;
      color: white;
      background: var(--primary);
      border: none;
      border-radius: 12px;
      cursor: pointer;
      text-decoration: none;
      transition: background 0.2s ease, transform 0.2s ease;
      box-shadow: 0 4px 12px rgba(99,102,241,0.25);
    }
    .btn:hover {
      background: var(--primary-600);
      transform: translateY(-2px);
    }
  </style>
</head>
<body>

  <!-- Navigation Bar -->
 <%@ include file = "common/navigation.jspf" %>

  <!-- Welcome Card -->
  <main class="card welcome-card">
    <div class="brand" aria-label="App Brand">
      <div class="brand__logo">TM</div>
      <span class="brand__name">TODO Manager</span>
    </div>
    
    <h1 id="welcomeMessage">Welcome to TODO Manager</h1>
   <p id="userName" style="margin-top: 0; font-size: 2.1rem; color: var(--muted);text-align: center;">
  ${userName}
</p>



 <a href="<c:url value='/manage-todo'/>" class="btn">Manage Your Todos</a>

  </main>

  <script src="<c:url value='/webjars/bootstrap/5.3.3/js/bootstrap.bundle.min.js'/>"></script>
</body>
</html>



