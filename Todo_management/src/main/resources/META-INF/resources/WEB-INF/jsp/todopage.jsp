<%@ include file ="common/header.jspf" %>
  <title>Todo List</title>
  <style>
    body {
      margin: 0;
      font-family: Inter, system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial, "Apple Color Emoji", "Segoe UI Emoji";
      background: #f9fafb;
    }
    .container {
      margin-top: 100px; /* so content doesn’t overlap navbar */
    }
  </style>
</head>
<body>

  <!-- Navigation Bar -->
<%@ include file = "common/navigation.jspf" %>

  <!-- Main Content -->
  <div class="container">
 <p id="UserName" style="margin-top: 0; font-size: 1.5rem; color: var(--bs-primary); font-weight: var(--bs-font-weight-bold);">
  ${UserName}
</p>

    <h1>Your Todos</h1>
    <table class="table table-striped table-bordered">
      <thead class="table-light">
        <tr>
          <th>ID</th>
          <th>Title</th>
          <th>Description</th>
          <th>Completed</th>
          <th>Created Date</th>
          <th>Due Date</th>
          <th>Priority</th>
          <th>User ID</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="todo" items="${todos}">
          <tr>
            <td>${todo.id}</td>
            <td>${todo.title}</td>
            <td>${todo.description}</td>
            <td>
              <c:choose>
                <c:when test="${todo.completed}"><span class="badge bg-success">Yes</span></c:when>
                <c:otherwise><span class="badge bg-secondary">No</span></c:otherwise>
              </c:choose>
            </td>
            <td>${todo.createdDate}</td>
            <td>${todo.dueDate}</td>
            <td>
              <c:choose>
                <c:when test="${todo.priority eq 'HIGH'}"><span class="badge bg-danger">High</span></c:when>
                <c:when test="${todo.priority eq 'MEDIUM'}"><span class="badge bg-warning text-dark">Medium</span></c:when>
                <c:otherwise><span class="badge bg-info text-dark">Low</span></c:otherwise>
              </c:choose>
            </td>
            <td>${todo.userId}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <script src="<c:url value='/webjars/bootstrap/5.3.3/js/bootstrap.bundle.min.js'/>"></script>
</body>
</html>
