<%@ include file ="common/header.jspf" %>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Login • TODO Manager</title>
  <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/5.3.3/css/bootstrap.min.css'/>">
  <style>
    :root {
      --bg: #f9fafb;
      --card: #ffffff;
      --muted: #6b7280;
      --text: #111827;
      --primary: #4f46e5;
      --primary-hover: #4338ca; 
      --error: #dc2626;
      --border: #e5e7eb;
    }

    body {
      margin: 0;
      font-family: 'Inter', system-ui, sans-serif;
      background: var(--bg);
      display: grid;
      place-items: center;
      height: 100vh;
      color: var(--text);
    }

    .card {
      width: 100%;
      max-width: 420px;
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: 12px;
      padding: 32px;
      box-shadow: 0 4px 24px rgba(0,0,0,0.05);
    }

    /* === TM LOGO STYLE === */
    .brand {
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 20px;
    }
    .logo {
      font-size: 28px;
      font-weight: 800;
      background: linear-gradient(135deg, var(--primary), #9333ea);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      font-family: "Segoe UI", sans-serif;
      letter-spacing: 1px;
    }

    h1 {
      text-align: center;
      font-size: 20px;
      margin-bottom: 6px;
    }

    p.muted {
      text-align: center;
      margin-bottom: 20px;
      color: var(--muted);
      font-size: 14px;
    }

    .field { margin-bottom: 16px; }
    .label { font-size: 13px; margin-bottom: 6px; color: var(--muted); }

    .input {
      width: 100%;
      padding: 12px 14px;
      border-radius: 8px;
      border: 1px solid var(--border);
      background: #fff;
      color: var(--text);
      outline: none;
      transition: border-color .15s, box-shadow .15s;
    }
    .input:focus {
      border-color: var(--primary);
      box-shadow: 0 0 0 3px rgba(79,70,229,0.2);
    }

    .row { display: flex; justify-content: space-between; align-items: center; font-size: 13px; margin: 10px 0 18px; }
    .checkbox { display: inline-flex; align-items: center; gap: 6px; cursor: pointer; color: var(--muted); }

    .btn {
      width: 100%;
      padding: 12px;
      border-radius: 8px;
      border: none;
      background: var(--primary);
      color: white;
      font-weight: 600;
      cursor: pointer;
      transition: background .2s ease;
    }
    .btn:hover { background: var(--primary-hover); }

    .error {
      color: var(--error);
      font-size: 13px;
      margin-top: 4px;
      min-height: 18px;
    }

    .or {
      display: flex;
      align-items: center;
      text-align: center;
      margin: 18px 0;
      font-size: 12px;
      color: var(--muted);
    }
    .or::before, .or::after {
      content: "";
      flex: 1;
      height: 1px;
      background: var(--border);
      margin: 0 10px;
    }

    .alt button {
      width: 100%;
      padding: 12px;
      border-radius: 8px;
      border: 1px solid var(--border);
      background: #f9fafb;
      color: var(--text);
      font-weight: 500;
    }
    .alt button:hover { background: #f3f4f6; }

    .footer {
      margin-top: 20px;
      text-align: center;
      font-size: 13px;
      color: var(--muted);
    }
    .footer a { color: var(--primary); text-decoration: none; }
    .footer a:hover { text-decoration: underline; }
  </style>
</head>
<body>
  <main class="card">
    <div class="brand">
      <div class="logo">TM</div>
    </div>

    <h1>Sign in to your account</h1>
    <p class="muted">Manage your tasks efficiently</p>

    <p id="errormessage" class="error">${errormassage}</p>

    <form id="loginForm" method="post" action="login">
      <div class="field">
        <div class="label"><label for="email">Email</label></div>
        <input class="input" id="email" name="email" type="email" placeholder="you@example.com" required />
      </div>

      <div class="field">
        <div class="label"><label for="password">Password</label></div>
        <input class="input" id="password" name="password" type="password" placeholder="••••••••" required minlength="6" />
      </div>

      <div class="row">
        <label class="checkbox"><input type="checkbox" id="remember" name="remember" /> Remember me</label>
        <a href="#" style="font-size: 13px; color: var(--primary);">Forgot password?</a>
      </div>

      <button class="btn" type="submit">Sign in</button>

      <div class="or">or continue with</div>

      <div class="alt">
        <button type="button">Continue with Demo</button>
      </div>

      <div class="footer">Don’t have an account? <a href="#">Create one</a></div>
    </form>
  </main>
</body>
</html>
