<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Login • TODO Manager</title>
  <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/5.3.3/css/bootstrap.min.css'/>">
  <style>
    :root {
      --bg: #0f172a;          /* slate-900 */
      --card: #111827;        /* gray-900 */
      --muted: #94a3b8;       /* slate-400 */
      --text: #e5e7eb;        /* gray-200 */
      --primary: #6366f1;     /* indigo-500 */
      --primary-600: #5457ef; /* indigo-600 */
      --ring: rgba(99,102,241,.35);
      --error: #ef4444;       /* red-500 */
    }

    * { box-sizing: border-box; }
    html, body { height: 100%; }
    body {
      margin: 0;
      font-family: Inter, system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial, "Apple Color Emoji", "Segoe UI Emoji";
      background: radial-gradient(1000px 600px at 80% -20%, rgba(99,102,241,.25), transparent 60%),
                  radial-gradient(800px 500px at -10% 110%, rgba(20,184,166,.18), transparent 60%),
                  var(--bg);
      color: var(--text);
      display: grid;
      place-items: center;
      padding: 24px;
    }

    .card {
      width: 100%;
      max-width: 420px;
      background: linear-gradient(180deg, rgba(255,255,255,.04), rgba(255,255,255,.02));
      border: 1px solid rgba(255,255,255,.08);
      border-radius: 20px;
      padding: 28px;
      box-shadow: 0 10px 30px rgba(0,0,0,.35);
      backdrop-filter: blur(6px);
    }

    .brand {
      display: flex;
      align-items: center;
      gap: 10px;
      margin-bottom: 18px;
    }
    .brand__logo {
      width: 36px; height: 36px;
      display: grid; place-items: center;
      border-radius: 11px;
      background: conic-gradient(from 180deg at 50% 50%, #22d3ee, #6366f1 40%, #22c55e 75%, #22d3ee);
      color: white; font-weight: 800;
      text-shadow: 0 1px 2px rgba(0,0,0,.25);
    }
    .brand__name { font-weight: 700; letter-spacing: .2px; }

    h1 { margin: 0 0 4px 0; font-size: 22px; }
    p.muted { margin: 0 0 18px 0; color: var(--muted); font-size: 14px; }

    .field { margin-bottom: 14px; }
    .label { display: flex; justify-content: space-between; margin-bottom: 6px; font-size: 13px; color: var(--muted); }

    .input {
      width: 100%;
      padding: 12px 14px;
      border-radius: 12px;
      border: 1px solid rgba(148,163,184,.25);
      background: rgba(17,24,39,.65);
      color: var(--text);
      outline: none;
      transition: box-shadow .15s ease, border-color .15s ease, transform .06s ease;
    }
    .input:focus {
      border-color: var(--primary);
      box-shadow: 0 0 0 4px var(--ring);
    }

    .row { display: flex; align-items: center; justify-content: space-between; gap: 10px; margin: 8px 0 16px; }
    .checkbox { display: inline-flex; align-items: center; gap: 8px; font-size: 13px; color: var(--muted); cursor: pointer; }
    .checkbox input { width: 16px; height: 16px; }

    .link { color: var(--text); text-decoration: none; font-size: 13px; opacity: .9; }
    .link:hover { text-decoration: underline; }

    .btn {
      width: 100%;
      padding: 12px 14px;
      border-radius: 12px;
      border: none;
      background: linear-gradient(180deg, var(--primary), var(--primary-600));
      color: white;
      font-weight: 600;
      letter-spacing: .3px;
      cursor: pointer;
      box-shadow: 0 8px 18px rgba(99,102,241,.35);
      transition: transform .06s ease, box-shadow .15s ease;
    }
    .btn:active { transform: translateY(1px); box-shadow: 0 6px 14px rgba(99,102,241,.3); }

    .or {
      display: grid; grid-template-columns: 1fr auto 1fr; align-items: center; gap: 10px; color: var(--muted); font-size: 12px; margin: 14px 0;
    }
    .or::before, .or::after { content: ""; height: 1px; background: rgba(148,163,184,.25); }

    .alt {
      display: grid; gap: 10px; grid-template-columns: 1fr;
    }
    .alt button { background: rgba(17,24,39,.65); border: 1px solid rgba(148,163,184,.25); color: var(--text); box-shadow: none; }

    .error { color: var(--error); font-size: 13px; margin: 6px 0 0; min-height: 18px; }
    .footer { margin-top: 18px; text-align: center; color: var(--muted); font-size: 12px; }
  </style>
</head>
<body>
  <main class="card" role="main">
    <div class="brand" aria-label="App Brand">
      <div class="brand__logo" aria-hidden="true">✓</div>
      <span class="brand__name">TODO Manager</span>
    </div>

    <h1>Welcome back</h1>
    <p class="muted">Log in to manage your tasks</p>
<p id="errormessage" 
   style="margin-top: 0; 
          font-size: 0.8rem; 
          color: red; 
          font-weight: bold;">
   ${errormassage}
</p>
    <!-- The form is now configured to submit directly -->
    <form id="loginForm" method="post" action="login">
      <div class="field">
        <div class="label"><label for="email">Email</label></div>
        <input class="input" id="email" name="email" type="email" placeholder="you@example.com" autocomplete="email" required />
      </div>

      <div class="field">
        <div class="label"><label for="password">Password</label><a class="link" href="#">Show</a></div>
        <input class="input" id="password" name="password" type="password" placeholder="••••••••" autocomplete="current-password" minlength="6" required />
        <div class="error" id="pwdError" aria-live="polite"></div>
      </div>

      <div class="row">
        <label class="checkbox"><input type="checkbox" id="remember" name="remember" /> Remember me</label>
        <a class="link" href="#">Forgot password?</a>
      </div>

      <button class="btn" type="submit">Sign in</button>

      <div class="or">or</div>

      <div class="alt">
        <!-- The button below still needs JavaScript to handle its logic -->
        <button type="button" class="btn" id="demoLogin">Continue with Demo</button>
      </div>

      <div class="footer">Do not have an account? <a class="link" href="#">Create one</a></div>
    </form>
  </main>
  <script src="<c:url value='/webjars/bootstrap/5.3.3/js/bootstrap.bundle.min.js'/>"></script>
</body>
</html>
