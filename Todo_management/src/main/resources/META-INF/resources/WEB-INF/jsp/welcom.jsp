<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Welcome • TODO Manager</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <style>
    /*
      Reusing the base styles for a consistent look and feel.
    */
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

    /* Custom styles for the welcome page */
    .welcome-card {
        text-align: center;
        padding: 50px 28px;
    }

    .welcome-card .brand__name {
        margin-bottom: 20px;
        font-size: 2rem;
    }

    #welcomeMessage {
      font-size: 1.5rem;
      font-weight: 500;
      margin-top: 0;
    }
  </style>
</head>
<body>
  <main class="card welcome-card">
    <div class="brand" aria-label="App Brand">
      <div class="brand__logo" aria-hidden="true">✓</div>
      <span class="brand__name">TODO Manager</span>
    </div>
    
    <h1 id="welcomeMessage">Welcome in todo manager</h1>
    
    <p id="userEmail" style="margin-top: 0; font-size: 1.2rem; color: var(--muted);">${email}</p>

  </main>
</body>
</html>