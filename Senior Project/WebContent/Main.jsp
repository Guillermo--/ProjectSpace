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
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link
	href='http://fonts.googleapis.com/css?family=Roboto:500,400italic,100,700italic,300,700,500italic,100italic,300italic,400'
	rel='stylesheet' type='text/css'>




<title>Main | ProjectSpace</title>
<script>
	function show_popup(popup) {
		document.getElementsByClassName(popup)[0].style.display = "block";
		document.getElementsByClassName('blur-background')[0].style.display = "block";

	}
	function hide_popup(popup) {
		document.getElementsByClassName(popup)[0].style.display = "none";
		document.getElementsByClassName('blur-background')[0].style.display = "none";

	}

	function formatDateDisplay() {
		var dateDiv = document.getElementsByClassName("coming-up-item-dueDate");
		for (var i = 0; i < dateDiv.length; i++) {
			var dateSpan = $(dateDiv).eq(i).find("span");
			var date_content = $(dateSpan).text();

			if (date_content != "") {
				var split = date_content.split("-");
				var newDate = split[1] + "/" + split[2] + "/" + split[0];
				$(dateSpan).eq(0).text(newDate);
			}
		}
	}

	$(document)
			.ready(
					function() {
						$('.project_item')
								.hover(
										function() {
											$(this).css('transition', "0.5s");
											$(this).css('-webkit-transform',
													'translateY(-2px)');
											$(this)
													.css('box-shadow',
															'0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22)');
										},
										function() {
											$(this).css('-webkit-transform',
													'translateY(0px)');
											$(this)
													.css('box-shadow',
															'0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23)');
										});

						formatDateDisplay();

					});
</script>

<style>
html {
	overflow: auto;
}

body {
	margin: 0;
	padding: 0;
	background: #eceff1;
}

.body-container {
	min-width: 1900px;
}

.navbar {
	min-width: 1900px;
	background: #455a64;
	border-radius: 0%;
	border: none;
	box-shadow: none;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
}

.label-default {
	position: relative;
	vertical-align: middle;
	font-size: 20px;
	background: #303F46;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

#header {
	position: relative;
	font-size: 30px;
	color: white;
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
}

.new-display-div {
	position: relative;
	display: inline-block;
	float: left;
	font-size: 20px;
	left: 200px;
}

.navbar-default .navbar-nav>li>a {
	color: white;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

.navbar-default .navbar-nav>li:hover {
	background: white;
}

.name_logout_div {
	position: relative;
	float: right;
	margin-top: 10px;
}

.txt_welcome {
	position: relative;
	font-size: 18px;
	margin-right: 15px;
	float: left;
	margin-top: 5px;
	color: white;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

#btn_logout {
	position: relative;
	float: right;
}

#btn_logout button {
	font-size: 18px;
	height: 30px;
	width: 40px;
	padding: 5px;
	background: none;
	border-radius: 0%;
	border: none;
	box-shadow: none;
}

#btn_logout button:hover {
	background: #2F3E44;
}

.main-div {
	position: relative;
	float: left;
	width: 1300px;
	margin-top: 7%;
	margin-left: 20px;
	padding-bottom: 40px;
}

.project_item {
	position: relative;
	display: inline-block;
	height: 250px;
	width: 350px;
	margin-bottom: 35px;
	margin-left: 60px;
	background: white;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
}

.project_item_title {
	text-align: center;
	padding-bottom: 10px;
	padding-top: 10px;
	font-size: 25px;
	background: #00bfa5;
}

.project_item_title a {
	color: white;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

.project_item_title a:hover {
	text-decoration: none;
}

.project_item_body span {
	position: relative;
	display: block;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	padding-bottom: 20px;
	padding-top: 20px;
	padding-left: 15px;
	font-size: 40px;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	color: black;
	background: white;
}

.coming-up-div {
	position: relative;
	float: right;
	width: 500px;
	min-height: 200px;
	margin-right: 70px;
	margin-top: 7%;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
	margin-bottom: 20px;
	background: white;
}

.coming-up-div-title {
	position: relative;
	background: #EF5350;
	height: 70px;
	width: 100%;
	color: white;
	text-align: center;
	padding-top: 10px;
	font-size: 20px;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

.coming-up-div-body {
	position: relative;
	width: 100%;
	height: 95%;
}

.coming-up-item {
	position: relative;
	border-bottom: 2px solid #eeeeee;
	width: 96%;
	min-height: 120px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 10px;
	color: black;
	padding-left: 10px;
	padding-right: 10px;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

.coming-up-item:last-of-type {
	border-bottom: none;
}

.coming-up-item-projectName {
	position: relative;
	width: 100%;
	height: 30px;
}

.coming-up-item-projectName span {
	position: relative;
	display: inline-block;
}

.coming-up-item-projectName #pname {
	float: left;
	width: 200px;
	font-weight: bold;
}

.coming-up-item-projectName #sprint {
	float: right;
	width: 150px;
	text-align: right;
}

.coming-up-item-story {
	position: relative;
	width: 100%;
	min-height: 40px;
	margin-bottom: 5px;
}

.coming-up-item-dueDate {
	position: relative;
	width: 100%;
	min-height: 30px;
	padding-top: 10px;
	padding-bottom: 2px;
	margin-bottom: 10px;
}

.coming-up-item-dueDate div {
	position: relative;
	display: inline-block;
}

.coming-up-item-dueDate div span {
	font-size: 15px;
	font-weight: 400;
	margin-left: 5px;
}

.coming-up-item-dueDate button {
	position: relative;
	display: inline-block;
	background: none;
	box-shadow: none;
	border: none;
	float: right;
	outline: none;
}

.new_project_popup {
	position: absolute;
	z-index: 10001;
	display: none;
	width: 25%;
	height: 52%;
	top: 20%;
	left: 45%;
	margin: -100px 0 0 -150px;
	background: white;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

.new_project_popup_title {
	position: relative;
	text-align: left;
	font-size: 20px;
	margin-left: 30px;
	color: black;
	padding-top: 25px;
	padding-bottom: 10px;
	font-family: 'Roboto', sans-serif;
	font-weight: 500;
}

.new_project_popup_body div {
	position: relative;
	margin-top: 30px;
	width: 85%;
	margin-left: 30px;
}

.new_project_popup_body div input {
	height: 30px;
	width: 250px;
	border: none;
	border-bottom: 1px solid #009688;
	outline: none;
	font-size: 18px;
	font-weight: 400;
}

.new_project_popup_body span {
	position: relative;
	display: block;
	margin-bottom: 5px;
	font-size: 18px;
}

.new_project_popup_body :last-child .btn-div {
	position: relative;
	margin-top: 10%;
	width: 100%;
	min-height: 40px;
	margin-left: 0px;
	padding-left: 48%;
}

.btn-div button {
	position: relative;
	float: left;
	margin-left: 10px;
	width: 100px;
	background: white;
	border: none;
	border-radius: 0%;
	box-shadow: none;
	font-size: 20px;
	font-family: 'Roboto', sans-serif;
	font-weight: 500;
}

.btn-div button:hover {
	color: #009688;
	background: none;
}

textarea {
	width: 100%;
	height: 100px;
	resize: none;
	overflow-y: scroll;
	border: 1px solid #009688;
	outline: none;
	font-size: 16px;
	font-weight: 400;
}

.hidden {
	display: none;
}

.blur-background {
	position: absolute;
	display: none;
	width: 100%;
	height: 100%;
	background: rgba(92, 92, 92, 0.6);
	filter: blur(5px);
	z-index: 1000;
}

.menu-div {
	position: absolute;
	width: 100%;
	height: 33%;
	top: 50px;
	z-index: 0;
	background: #607d8b;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

.menu-header {
	color: white;
	position: relative;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	min-width: 40%;
	height: 30%;
	display: inline-block;
	margin-top: 2%;
	margin-left: 5%;
}

.menu-header .subtitle {
	position: absolute;
	height: 100%;
	width: 25%;
	display: inline-block;
	font-size: 55px;
	text-align: center;
	font-weight: 300;
	padding-top: 0.5%;
}
</style>

</head>

<body>
	<div class="blur-background"></div>

	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<span class="navbar-brand"><span class="label label-default">Project
				| Space</span></span> <span id="header" class="navbar-brand">My Projects</span>

		<div class="collapse navbar-collapse new-display-div"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li id="btn_new"><a href="#"
					onClick="show_popup('new_project_popup')">New</a></li>
				<li class="dropdown" id="btn_display"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown">Display<span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">All</a></li>
						<li><a href="#">Completed</a></li>
						<li><a href="#">Incomplete</a></li>
					</ul></li>
			</ul>
		</div>
		<div class="name_logout_div">
			<div class="txt_welcome">
				Welcome,
				<%=session.getAttribute("uname")%></div>
			<div id="btn_logout" class="btn-group">
				<form name="logout_form" action="Logout_Controller" method="GET">
					<button type="submit" class="brn btn-danger">
						<span class="glyphicon glyphicon-log-out"></span>
					</button>
				</form>
			</div>
		</div>
	</div>
	</nav>

	<div class="menu-div">
		<div class="menu-header">
			<div class="subtitle"></div>
		</div>
	</div>

	<div class="body-container">
		<div class="main-div">
			<c:if test="${not empty projects}">
				<c:forEach items="${projects}" var="item">
					<div class="project_item">
						<div class="project_item_title">
							<a
								href="ProjectItem_Controller?method=GET&project_item=${item[0]}">${item[0]}</a>
						</div>
						<div class="project_item_body">
							<span class="progress_percent">${item[1]}</span>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>

		<div class="coming-up-div">
			<div class="coming-up-div-title">Coming up...</div>
			<div class="coming-up-div-body">
				<c:if test="${not empty comingup}">
					<c:forEach items="${comingup}" var="item">
						<div class="coming-up-item">
							<form id="coming-up-form">
								<div class="coming-up-item-projectName">
									<span id="pname">${item[0]}</span><span id="sprint">${item[1]}</span>
								</div>
								<div class="coming-up-item-story">&ldquo;${item[2]}&rdquo;</div>
								<div class="coming-up-item-dueDate">
									<div>
										Due on: <span>${item[3]}</span>
									</div>
									<button type="submit" formaction="Delete_To_Do_Controller"
										formmethod="POST" class="btn-delete-todo">
										<span class="glyphicon glyphicon-trash"></span>
									</button>
								</div>
								<input class="hidden" name="to_delete_id" value="${item[4]}">
							</form>
						</div>
					</c:forEach>
				</c:if>
			</div>

		</div>
	</div>

	<div class="new_project_popup">
		<div class="new_project_popup_title">New Project</div>
		<div class="new_project_popup_body">
			<form name="new_project_form" action="NewProject_Controller"
				method="POST" onSubmit="hide_popup('new_project_popup')">
				<div class="input-group">
					<span>Project Name:</span> <input type="text" name="projectName"
						required autocomplete="off">
				</div>
				<div class="input-group">
					<span>Start date:</span> <input type="text" name="dateStarted">
				</div>
				<div>
					<span>Description:</span>
					<textarea name="projectDescription"></textarea>
				</div>
				<div class="btn-div">
					<button type="submit" class="btn btn-default">Ok</button>
					<button type="button" class="btn btn-default"
						onClick="hide_popup('new_project_popup')">Cancel</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>