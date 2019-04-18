<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<title>Wander</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
<style>
body {
	font: 400 15px Lato, sans-serif;
	line-height: 1.8;
	color: #818181;
}

h2 {
	font-size: 24px;
	text-transform: uppercase;
	color: #303030;
	font-weight: 600;
	margin-bottom: 30px;
}

h4 {
	font-size: 19px;
	line-height: 1.375em;
	color: #303030;
	font-weight: 400;
	margin-bottom: 30px;
}

.jumbotron {
	background-color: #1abc9c;
	color: #fff;
	padding: 100px 25px;
	font-family: Montserrat, sans-serif;
}

.container-fluid {
	padding: 60px 50px;
}

.bg-grey {
	background-color: #f6f6f6;
}

.logo-small {
	color: #f4511e;
	font-size: 50px;
}

.logo {
	color: #f4511e;
	font-size: 200px;
}

.thumbnail {
	padding: 0 0 15px 0;
	border: none;
	border-radius: 0;
}

.thumbnail img {
	width: 100%;
	height: 100%;
	margin-bottom: 10px;
}

.carousel-control.right, .carousel-control.left {
	background-image: none;
	color: #f4511e;
}

.carousel-indicators li {
	border-color: #f4511e;
}

.carousel-indicators li.active {
	background-color: #f4511e;
}

.item h4 {
	font-size: 19px;
	line-height: 1.375em;
	font-weight: 400;
	font-style: italic;
	margin: 70px 0;
}

.item span {
	font-style: normal;
}

.panel {
	border: 1px solid #f4511e;
	border-radius: 0 !important;
	transition: box-shadow 0.5s;
}

.panel:hover {
	box-shadow: 5px 0px 40px rgba(0, 0, 0, .2);
}

.panel-footer .btn:hover {
	border: 1px solid #f4511e;
	background-color: #fff !important;
	color: #f4511e;
}

.panel-heading {
	color: #fff !important;
	background-color: #f4511e !important;
	padding: 25px;
	border-bottom: 1px solid transparent;
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	border-bottom-left-radius: 0px;
	border-bottom-right-radius: 0px;
}

.panel-footer {
	background-color: white !important;
}

.panel-footer h3 {
	font-size: 32px;
}

.panel-footer h4 {
	color: #aaa;
	font-size: 14px;
}

.panel-footer .btn {
	margin: 15px 0;
	background-color: #f4511e;
	color: #fff;
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
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<div class="navbar-brand">Wander</div>
			</div>
		</div>
	</nav>

	<!-- Container (Contact Section) -->
	<div id="contact" class="container-fluid bg-grey">
		<h2 class="text-center">Wander Interview Coding Challenge!!!</h2>

		<div class="row">
			<div class="col-sm-5">
				<p>My Contact Information !!!</p>
				<p>
					<span class="glyphicon glyphicon-map-marker"></span> Chennai, India
				</p>
				<p>
					<span class="glyphicon glyphicon-phone"></span> +91 9176268577
				</p>
				<p>
					<span class="glyphicon glyphicon-envelope"></span>
					challasiva1508@gmail.com
				</p>
			</div>

			<!-- LOGIN -->
			<div class="col-sm-7">
				<spring:url value="/login" var="loginUrl" />
				<form:form class="form-horizontal" method="post"
					action="${loginUrl }">
					<div class="form-group">
						<label for="email" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-7">
							<input type="email" class="form-control" id="email" name="email"
								placeholder="Email" required />
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-7">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="Password" required />
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-10 form-group">
							<button class="btn btn-primary btn-sm" type="submit">Login</button>
						</div>
					</div>
				</form:form>
			</div>

			<!-- REGISTRATION -->
			<div class="col-sm-7">
				<spring:url value="/registration" var="registrationUrl" />
				<form:form class="form-horizontal" method="post"
					action="${registrationUrl }">
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label"> Name</label>
						<div class="col-sm-7">
							<input type="text" ng-model="userDto.userName"
								class="form-control" id="name" name="userName"
								placeholder="Name" required />
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-2 control-label"> Email</label>
						<div class="col-sm-7">
							<input type="email" ng-model="userDto.email" class="form-control"
								id="email" name="email" placeholder="Email" required />
						</div>
					</div>
					<div class="form-group">
						<label for="mobile" class="col-sm-2 control-label"> Mobile</label>
						<div class="col-sm-7">
							<input type="text" ng-model="userDto.mobile" class="form-control"
								id="mobile" name="mobileNumber" placeholder="Mobile" required />
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">
							Password</label>
						<div class="col-sm-7">
							<input type="password" ng-model="userDto.password"
								class="form-control" id="password" name="password"
								placeholder="Password" required />
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-10">
							<button type="submit" class="btn btn-primary btn-sm">
								Save & Continue</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>

</body>

</html>