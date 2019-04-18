<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Wander</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>
body {
	font: 400 15px Lato, sans-serif;
	line-height: 1.8;
	color: #818181;
}

.container-fluid {
	padding: 60px 50px;
}

.bg-grey {
	background-color: #f6f6f6;
}

.navbar {
	margin-bottom: 0;
	background-color: #f4511e;
	z-index: 9999;
	border: 0;
	font-size: 12px !important;
	line-height: 1.42857143 !important;
	letter-spacing: 4px;
	border-radius: 0;
	font-family: Montserrat, sans-serif;
}

.navbar li a, .navbar .navbar-brand {
	color: #fff !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
	color: #f4511e !important;
	background-color: #fff !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
	color: #fff !important;
}
</style>

</head>

<body data-spy="scroll" data-target=".navbar" data-offset="60">
	<%
		Object user = request.getAttribute("user");
	%>

	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a href="/logout" class="navbar-brand">Wander Logout</a>
			</div>
		</div>
	</nav>

	<div id="noteID" class="container-fluid">
		<label for="email" class="col-sm-2 control-label">Welcome
			<strong>${user.userName }</strong></label> <br> <br>
		<div class="tab-pane" id="add-comment">

			<spring:url value="/users/${user.id }/notes" var="addNoteUrl" />
			<form:form action="${addNoteUrl }" method="post"
				class="form-horizontal" modelAttribute="notesForm" role="form">
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label"> Title</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="title" name="title"
							placeholder="Note title here.." required />
					</div>
				</div>
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label"> Note</label>
					<div class="col-sm-8">
						<textarea class="form-control" name="note" id="note"
							placeholder="Please add your Note here .." rows="5" required></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button class="btn btn-success btn-circle text-uppercase"
							type="submit">
							<span class="glyphicon glyphicon-list-alt"></span> Add Note
						</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>

	<div class="container">
		<h2>Notes list</h2>
		<table class="table table-striped">
			<thead>
				<th scope="row">User ID</th>
				<th scope="row">Note ID</th>
				<th scope="row">Title</th>
				<th scope="row">Note</th>
				<th scope="row">Created</th>
				<th scope="row">Updated</th>
				<th scope="row">Update</th>
				<th scope="row">Delete</th>
			</thead>
			<tbody>
				<c:forEach items="${notesList }" var="note">
					<tr>
						<td>${user.id }</td>
						<td>${note.id }</td>
						<td>${note.title }</td>
						<td>${note.note }</td>
						<td>${note.created }</td>
						<td>${note.updated }</td>
						<td><spring:url
								value="/updateNote/users/${user.id }/notes/${note.id }"
								var="updateURL" /> <a class="btn btn-primary"
							href="${updateURL }" role="button">Update</a></td>
						<td><spring:url
								value="/deleteNote/users/${user.id }/notes/${note.id }"
								var="deleteURL" /> <a class="btn btn-primary"
							href="${deleteURL }" role="button">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>


