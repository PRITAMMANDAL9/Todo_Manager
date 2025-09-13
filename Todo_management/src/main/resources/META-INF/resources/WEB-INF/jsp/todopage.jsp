<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="common/header.jspf" %>

<title>Todo List</title>
</head>
<body>
  <%@ include file="common/navigation.jspf" %>

  <div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
      <div>
        <h2 class="mb-0">Your Todos</h2>
        <small class="text-muted">Signed in as <strong>${UserName}</strong></small>
      </div>
      <div>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addTodoModal">
          + Add Todo
        </button>
      </div>
    </div>

    <!-- flash messages -->
    <c:if test="${not empty error}">
      <div class="alert alert-danger" role="alert">${error}</div>
    </c:if>
    <c:if test="${not empty success}">
      <div class="alert alert-success" role="alert">${success}</div>
    </c:if>

    <!-- Todos table -->
    <div class="card shadow-sm">
      <div class="card-body p-0">
        <table class="table table-hover mb-0">
          <thead class="table-light">
            <tr>
              <th>#</th>
              <th>Title</th>
              <th>Description</th>
              <th>Priority</th>
              <th>Created</th>
              <th>Due</th>
              <th>Completed</th>
              <th class="text-end">Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="todo" items="${todos}">
              <tr class="${todo.completed ? 'table-success' : ''}">
                <td>${todo.id}</td>
                <td>${todo.title}</td>
                <td style="max-width:360px; white-space:pre-wrap;">${todo.description}</td>
                <td>
                  <c:choose>
                    <c:when test="${todo.priority == 'HIGH'}"><span class="badge bg-danger">High</span></c:when>
                    <c:when test="${todo.priority == 'MEDIUM'}"><span class="badge bg-warning text-dark">Medium</span></c:when>
                    <c:otherwise><span class="badge bg-info text-dark">Low</span></c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <c:choose>
                    <c:when test="${not empty todo.createdDate}">
                      ${fn:substringBefore(todo.createdDate, 'T')}
                    </c:when>
                    <c:otherwise>-</c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <c:choose>
                    <c:when test="${not empty todo.dueDate}">
                      <!-- show only date portion for table; full value will be used for edit -->
                      ${fn:substringBefore(todo.dueDate, 'T')}
                    </c:when>
                    <c:otherwise>-</c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <c:choose>
                    <c:when test="${todo.completed}">
                      <span class="badge bg-success">Yes</span>
                    </c:when>
                    <c:otherwise>
                      <span class="badge bg-secondary">No</span>
                    </c:otherwise>
                  </c:choose>
                </td>
                <td class="text-end">
                  <!-- Toggle complete -->
                  <form action="${pageContext.request.contextPath}/todos/${todo.id}/toggle" method="post" style="display:inline;">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <button class="btn btn-sm btn-outline-success" title="Toggle Complete">
                      <c:choose>
                        <c:when test="${todo.completed}">Undo</c:when>
                        <c:otherwise>Done</c:otherwise>
                      </c:choose>
                    </button>
                  </form>

                  <!-- Edit button: pass full todo.dueDate (may include time). JS will normalize -->
                  <button
                    class="btn btn-sm btn-outline-primary"
                    data-bs-toggle="modal"
                    data-bs-target="#editTodoModal"
                    data-id="${todo.id}"
                    data-title="${fn:escapeXml(todo.title)}"
                    data-desc="${fn:escapeXml(todo.description)}"
                    data-due="${not empty todo.dueDate ? fn:escapeXml(todo.dueDate) : ''}"
                    data-priority="${todo.priority}">
                    Edit
                  </button>

                  <!-- Delete -->
                  <form action="${pageContext.request.contextPath}/todos/${todo.id}/delete" method="post" style="display:inline;" onsubmit="return confirm('Delete this todo?');">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <button class="btn btn-sm btn-outline-danger">Delete</button>
                  </form>
                </td>
              </tr>
            </c:forEach>
            <c:if test="${empty todos}">
              <tr><td colspan="8" class="text-center p-4 text-muted">No todos yet — add your first one!</td></tr>
            </c:if>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <!-- SINGLE Add Todo Modal (uses datetime-local) -->
  <div class="modal fade" id="addTodoModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <form action="${pageContext.request.contextPath}/todos/add" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Add Todo</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="mb-3">
              <label class="form-label">Title</label>
              <input type="text" name="title" required class="form-control" />
            </div>
            <div class="mb-3">
              <label class="form-label">Description</label>
              <textarea name="description" class="form-control" rows="3"></textarea>
            </div>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label class="form-label">Due (optional)</label>
                <!-- datetime-local value format: yyyy-MM-ddTHH:mm -->
                <input name="dueDate" class="form-control" type="datetime-local" />
              </div>
              <div class="col-md-6 mb-3">
                <label class="form-label">Priority</label>
                <select name="priority" class="form-select">
                  <option value="LOW">Low</option>
                  <option value="MEDIUM" selected>Medium</option>
                  <option value="HIGH">High</option>
                </select>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-primary">Save</button>
          </div>
        </div>
      </form>
    </div>
  </div>

  <!-- SINGLE Edit Todo Modal (populated by JS) -->
  <div class="modal fade" id="editTodoModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <!-- JS will set action to ctx + '/todos/{id}/edit' -->
        <form id="editTodoForm" method="post">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
          <div class="modal-header">
            <h5 class="modal-title">Edit Todo</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <!-- hidden id kept for convenience but controller uses path variable -->
            <input type="hidden" id="edit-id" name="id" />
            <div class="mb-3">
              <label class="form-label">Title</label>
              <input id="edit-title" name="title" required class="form-control" />
            </div>
            <div class="mb-3">
              <label class="form-label">Description</label>
              <textarea id="edit-desc" name="description" rows="3" class="form-control"></textarea>
            </div>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label class="form-label">Due</label>
                <!-- datetime-local for edits too -->
                <input id="edit-due" name="dueDate" class="form-control" type="datetime-local" />
              </div>
              <div class="col-md-6 mb-3">
                <label class="form-label">Priority</label>
                <select id="edit-priority" name="priority" class="form-select">
                  <option value="LOW">Low</option>
                  <option value="MEDIUM">Medium</option>
                  <option value="HIGH">High</option>
                </select>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
            <button class="btn btn-primary" type="submit">Save changes</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script src="<c:url value='/webjars/bootstrap/5.3.3/js/bootstrap.bundle.min.js'/>"></script>

  <!-- safe context path for JS -->
  <script>
    const ctx = '${pageContext.request.contextPath}';
  </script>

  <!-- Populate Edit modal from button data-* attributes and set form action -->
  <script>
    (function () {
      const editModalEl = document.getElementById('editTodoModal');
      if (!editModalEl) return;

      editModalEl.addEventListener('show.bs.modal', function (event) {
        const button = event.relatedTarget;
        const id = button.getAttribute('data-id');
        const title = button.getAttribute('data-title') || '';
        const desc = button.getAttribute('data-desc') || '';
        const due = button.getAttribute('data-due') || '';
        const priority = button.getAttribute('data-priority') || 'LOW';

        // populate fields
        document.getElementById('edit-id').value = id;
        document.getElementById('edit-title').value = title;
        document.getElementById('edit-desc').value = desc;

        // Normalize ISO datetime to datetime-local value (yyyy-MM-ddTHH:mm)
        // incoming due might be "2025-09-05T14:30", "2025-09-05T14:30:00", or ""
        if (due) {
          let v = due;
          // if contains seconds (length > 16), trim to first 16 chars
          if (v.length > 16) v = v.substring(0,16);
          document.getElementById('edit-due').value = v;
        } else {
          document.getElementById('edit-due').value = '';
        }

        document.getElementById('edit-priority').value = priority;

        // set form action using ctx so id becomes path variable
        const form = document.getElementById('editTodoForm');
        form.action = ctx + '/todos/' + id + '/edit';
      });
    })();
  </script>
</body>
</html>
