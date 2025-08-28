<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<link rel="stylesheet"
			href="<c:url value='/webjars/bootstrap/5.3.3/css/bootstrap.min.css'/>">
			<title>Todo List</title>
	</head>
	<body>
	<div class ="container">
		<h1>Your todos</h1>
		<table class ="table">
		<thead>
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
                        ${todo.completed}
                    </td>
                    <td>${todo.createdDate}</td>
                    <td>${todo.dueDate}</td>
                    <td>
                       ${todo.priority eq 'HIGH'}
                    </td>
                    <td>${todo.userId}</td>
                </tr>
            </c:forEach>
        </tbody>
		</table>
		
		</div>
		<script
			src="<c:url value='/webjars/bootstrap/5.3.3/js/bootstrap.bundle.min.js'/>"></script>
	</body>
</html>