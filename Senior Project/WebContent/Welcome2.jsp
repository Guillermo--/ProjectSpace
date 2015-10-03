<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link
	href='http://fonts.googleapis.com/css?family=Roboto:500,400italic,100,700italic,300,700,500italic,100italic,300italic,400'
	rel='stylesheet' type='text/css'>

<title>Welcome | ProjectSpace</title>

<style>
html {
	margin: 0;
	padding: 0;
}

body {
	background: #455a64;
	height: 100%;
	width: 100%;
	overflow: hidden;
}

.title {
	position: relative;
	margin-top: 2%;
	font-size: 80px;
	margin-left: 5%;
	color: white;
	width: 90%;
	border-bottom: 1px solid #00bfa5;
	float: left;
	clear: both;
	font-family: 'Roboto', sans-serif;
	font-weight: 200;
}

.intro {
	position: relative;
	margin-left: 10%;
	font-size: 30px;
	margin-top: 10%;
	width: 35%;
	height: 250px;
	float: left;
	clear: both;
	color: white;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

.intro button {
	position: relative;
	border: none;
	background: #37474f;
	outline: none;
	color: white;
	box-shadow: none;
	width: 150px;
	height: 40px;
	margin-top: 10%;
	font-size: 18px;
	margin-left: 30%;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
}

#form-fields-login {
	position: relative;
	margin-left: 20%;
	margin-top: 5%;
	height: 450px;
	width: 27%;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
	display: inline-block;
	background: #00bfa5;
}

#form-fields-join {
	position: relative;
	margin-left: 120%;
	margin-top: -24%;
	height: 550px;
	width: 27%;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
	display: inline-block;
	background: #00bfa5;
}

.form-fields-title {
	position: relative;
	color: white;
	display: block;
	margin-left: 30px;
	margin-bottom: 50px;
	margin-top: 30px;
	font-size: 25px;
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
}

#form-fields-login form span, #form-fields-join form span {
	color: white;
	display: block;
	font-size: 20px;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	margin-left: 30px;
	margin-top: 30px;
}

#form-fields-login form input, #form-fields-join form input {
	position: relative;
	margin-left: 30px;
	margin-top: 10px;
	outline: none;
	background: none;
	border: none;
	border-bottom: 1px solid #455a64;
	width: 400px;
	color: white;
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
	font-size: 25px;
}

#form-fields-login form button, #form-fields-join form button {
	position: relative;
	float: right;
	margin-right: 10%;
	margin-top: 80px;
	box-shadow: none;
	outline: none;
	background: none;
	border: none;
	color: white;
	font-family: 'Roboto', sans-serif;
	font-weight: 500;
	width: 100px;
	height: 40px;
	font-size: 25px;
}

#form-fields-login form button:hover, #form-fields-join form button:hover
	{
	color: #455a64;
}

#form-fields-login .switch-forms, #form-fields-join .switch-forms {
	color: white;
	position: relative;
	margin-top: 95px;
	margin-left: 30px;
	font-size: 16px;
	width: 200px;
	height: 40px;
	box-shadow: none;
}

#form-fields-login .switch-forms:hover, #form-fields-join .switch-forms:hover
	{
	color: #455a64;
	cursor: pointer;
}

.errorAlert {
	position: absolute;
	width: 240px;
	height: 50px;
	left: 100%;
	top: 18%;
	padding-left: 7px;
	padding-top: 13px;
	text-align: left;
	background: #EF5350;
	color: white;
	border: none;
	border-radius: 0%;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
	z-index: 999;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	font-size: 15px;
}
</style>

<script>
	$(document)
			.ready(
					function() {
						var button = document
								.getElementsByClassName("learn_more_btn");
						var link = document
								.getElementsByClassName("switch-forms");

						$(button)
								.hover(
										function() {
											$(button).css('transition', '0.5s');
											$(button).css('-webkit-transform',
													'translateY(-2px)');
											$(button)
													.css('box-shadow',
															'0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23)');
										},
										function() {
											$(button).css('transition', '0.5s');
											$(button).css('-webkit-transform',
													'translateY(0px)');
											$(button)
													.css('box-shadow',
															'0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23)');
										});

						var alertmsge = document
								.getElementsByClassName("errorAlert")[0];

						$(alertmsge).css('transition', '1s');
						$(alertmsge).css('-webkit-transform',
								'translateX(-220%)');

						window.setTimeout(function() {
							$(alertmsge).css('transition', '1s');
							$(alertmsge).css('-webkit-transform',
									'translateX(0%)');
						}, 4000);

					});

	function switchForms(obj) {
		var id = $(obj).attr("id");
		var toHide = document.getElementById(id);

		if (id == "form-fields-login") {
			$(toHide).css('transition', "1.5s");
			$(toHide).css('box-shadow',
					'0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23)');
			$(toHide).css('-webkit-transform', 'translateX(200%)');
			$(toHide).css('box-shadow',
					'0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23)');

			var toShow = document.getElementById("form-fields-join");
			$(toShow).css('transition', "1.5s");
			$(toShow).css('box-shadow',
					'0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23)');
			$(toShow).css('-webkit-transform', 'translateX(-200%)');
			$(toShow).css('box-shadow',
					'0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23)');
		} else {
			$(toHide).css('transition', "1.5s");
			$(toHide).css('box-shadow',
					'0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23)');
			$(toHide).css('-webkit-transform', 'translateX(0%)');
			$(toHide).css('box-shadow',
					'0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23)');
			var toShow = document.getElementById("form-fields-login");
			$(toShow).css('transition', "1.5s");
			$(toShow).css('box-shadow',
					'0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23)');
			$(toShow).css('-webkit-transform', 'translateX(0%)');
			$(toShow).css('box-shadow',
					'0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23)');
		}
	}
</script>


</head>


<body>

	<div class="title">Project | Space</div>

	<div class="intro">
		A tool that allows users to keep track of simple software development
		projects.<br> <br> Inspired by the Agile methodology.
		<div class="buttons">
			<button class="learn_more_btn" type="button">Learn More!</button>
		</div>
	</div>

	<div id="form-fields-login">
		<span class="form-fields-title">Login</span>
		<form name="login-form" method="POST" action="Login_Controller">
			<div>
				<span>User Name:</span> <input type="text" name="user"
					autocomplete="off" required>
			</div>
			<div>
				<span>Password:</span> <input type="password" name="password"
					required>
			</div>

			<button type="submit">Go!</button>
		</form>

		<p class="switch-forms" id="form-fields-login"
			onClick="switchForms(this);">Don't have an account?</p>
	</div>


	<div id="form-fields-join">
		<span class="form-fields-title">Sign Up</span>
		<form name="signup-form" method="POST" action="Join">
			<div>
				<span>User Name:</span> <input type="text" name="user"
					autocomplete="off" required>
			</div>
			<div>
				<span>Password:</span> <input type="password" name="password-1"
					required>
			</div>

			<div>
				<span>Re-enter Password:</span> <input type="password"
					name="password-2" required>
			</div>

			<button type="submit">Join!</button>
		</form>

		<p class="switch-forms" id="form-fields-join"
			onClick="switchForms(this);">Already a member?</p>
	</div>

	<c:if test="${not empty error}">
		<div class="errorAlert">${error}</div>
	</c:if>

</body>


</html>