<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link
	href='http://fonts.googleapis.com/css?family=Roboto:500,400italic,100,700italic,300,700,500italic,100italic,300italic,400'
	rel='stylesheet' type='text/css'>



<title>${current_projectName}| ProjectSpace</title>

<style>
html {
	overflow: auto;
}

body {
	margin: 0;
	padding: 0;
	background: #eceff1;
}

.navbar {
	min-width: 1900px;
	background: #455a64;
	border-radius: 0%;
	border: none;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
}

.body-container {
	min-width: 1800px;
	margin-top: -17px;
}

.label-default {
	position: relative;
	vertical-align: middle;
	font-size: 20px;
	background: #303F46;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

.navbar-default .navbar-nav>li {
	height: 50px;
}

.navbar-default .navbar-nav>li>a {
	color: white;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

.navbar-default .navbar-nav>li:hover {
	background: white;
	color: white;
}

#header {
	position: relative;
	font-size: 30px;
	color: white;
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
}

.name_logout_div {
	position: relative;
	float: right;
	margin-top: 10px;
	color: white;
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

.navbar-items {
	position: absolute;
	left: 50%;
	font-size: 20px;
}

.menu-bar {
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

.menu-bar .menu-buttons {
	position: relative;
	float: right;
	margin-right: 8%;
	height: 40px;
	vertical-align: middle;
	margin-top: 5%;
}

.menu-header {
	color: white;
	position: relative;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	width: 25%;
	height: 30%;
	display: inline-block;
	margin-top: 3%;
	margin-left: 5%;
}

.menu-header .subtitle {
	position: absolute;
	height: 80%;
	width: 45%;
	border-right: 2px solid white;
	display: inline-block;
	font-size: 50px;
	text-align: center;
	font-weight: 300;
}

.completed-hours span, .total-hours span {
	font-size: 25px;
}

.completed-hours {
	top: 35%;
}

.completed-hours, .total-hours {
	position: absolute;
	left: 50%;
	height: 50%;
	min-width: 40%;
	font-size: 20px;
}

.menu-bar .menu-buttons button {
	position: relative;
	display: inline-block;
	vertical-align: middle;
	text-align: center;
	font-size: 20px;
	width: 50px;
	height: 50px;
	background: none;
	border: none;
	box-shadow: none;
	border-radius: 0%;
	color: white;
}

.menu-bar .menu-buttons button:hover {
	background: #435861;
}

.sprint-backlog {
	position: relative;
	min-width: 1600px;
	width: 1600px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 10%;
	margin-bottom: 40px;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
	z-index: 0;
}

.backlog-title {
	display: flex;
}

.backlog-title div {
	position: relative;
	display: inline-block;
	text-align: center;
	padding: 10px;
	font-size: 18px;
	border: white;
	background: #00bfa5;
	color: white;
	flex: 1 auto;
	-webkit-user-modify: read-only;
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
}

.backlog-checkbox .checkbox {
	display: block;
	margin-top: 5px;
	margin-left: 5px;
	float: left;
	width: 15px;
	height: 15px;
	cursor: pointer;
	vertical-align: middle;
	box-shadow: none;
}

.checkbox:before {
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
	content: "";
	position: absolute;
	left: 0;
	z-index: 1;
	width: 18px;
	height: 18px;
	border: 2px solid #DADADA;
}

.checkbox:checked:before {
	-webkit-transform: rotate(-45deg);
	-moz-transform: rotate(-45deg);
	-ms-transform: rotate(-45deg);
	-o-transform: rotate(-45deg);
	transform: rotate(-45deg);
	height: 10px;
	border-color: #00bfa5;
	border-top-style: none;
	border-right-style: none;
}

.checkbox:after {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 18px;
	height: 18px;
	background: #fff;
	cursor: pointer;
}

.backlog-title .checkbox:after {
	background: #00bfa5;
}

.backlog-title .checkbox:checked:before {
	border-color: white;
}

.backlog-checkbox {
	width: 50px;
	-webkit-user-modify: read-only;
	border-right: 1px solid #bdbdbd;
}

.backlog-story, .entry-story {
	width: 600px;
	-webkit-user-modify: read-write;
	border-right: 1px solid #bdbdbd;
}

.backlog-hours, .entry-hours {
	width: 100px;
	-webkit-user-modify: read-write;
	border-right: 1px solid #bdbdbd;
}

.backlog-priority, .entry-priority {
	width: 100px;
	-webkit-user-modify: read-write;
	border-right: 1px solid #bdbdbd;
}

.backlog-notes, .entry-notes {
	width: 550px;
	-webkit-user-modify: read-write;
	border-right: 1px solid #bdbdbd;
}

.backlog-status, .entry-status {
	width: 200px;
	-webkit-user-modify: read-write;
	border-right: 1px solid #bdbdbd;
}

.backlog-sprint, .entry-sprint {
	width: 120px;
	-webkit-user-modify: read-write;
}

.entry div {
	position: relative;
	text-align: center;
	font-size: 15px;
	word-wrap: break-word;
	vertical-align: middle;
	flex: 1 auto;
	padding: 10px;
	border-top: 1px solid #bdbdbd;
	z-index: 3;
	background: white;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

.entry div:focus, .new-entry div:focus {
	background: #EBEBE0;
	outline: none;
}

.entry {
	position: relative;
	display: flex;
}

.new-entry div {
	position: relative;
	text-align: center;
	font-size: 15px;
	min-height: 50px;
	border-top: 1px solid #bdbdbd;
	word-wrap: break-word;
	vertical-align: middle;
	flex: 1 auto;
	padding: 15px;
	z-index: 3;
	background: white;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

.new-entry {
	position: relative;
	display: none;
}

.new-entry input, .entry input {
	display: none;
}

#btn-new-story {
	position: fixed;
	top: 85%;
	left: 1800px;
	border-radius: 50%;
	width: 70px;
	height: 70px;
	font-size: 50px;
	text-align: center;
	z-index: 1px;
	outline: none;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
	border: none;
	background: #00bcd4;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
	padding: 0px;
}

::-webkit-scrollbar {
	width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	-webkit-border-radius: 8px;
	border-radius: 8px;
}

/* Handle */
::-webkit-scrollbar-thumb {
	-webkit-border-radius: 8px;
	border-radius: 8px;
	background: #8F8F7D;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.5);
}

::-webkit-scrollbar-thumb:window-inactive {
	background: rgba(255, 0, 0, 0.4);
}

.alert-saved {
	position: absolute;
	width: 240px;
	left: 2%;
	top: 92%;
	text-align: left;
	background: #455a64;
	color: white;
	border: none;
	border-radius: 0%;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
	z-index: 999;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

.hidden {
	display: none;
}

.add_to_do_popup {
	position: absolute;
	border: 1px solid #00246B;
	z-index: 10001;
	display: none;
	width: 30%;
	height: 35%;
	top: 20%;
	left: 45%;
	margin: -100px 0 0 -150px;
	background: white;
	-webkit-box-shadow: 0px 12px 20px 0px rgba(0, 0, 0, 0.5);
	-moz-box-shadow: 0px 12px 20px 0px rgba(0, 0, 0, 0.5);
	box-shadow: 0px 12px 20px 0px rgba(0, 0, 0, 0.5);
}

.add_to_do_popup_title {
	position: relative;
	text-align: center;
	font-size: 20px;
	border-bottom: 1px solid none;
	background: #00246B;
	color: white;
	font-style: bold;
	padding-top: 10px;
	padding-bottom: 10px;
}

.add_to_do_popup_storyTitle {
	position: relative;
	min-height: 40%;
	font-size: 18px;
	text-align: center;
	padding: 15px;
}

.add_to_do_popup_body, .add_to_do_popup_body form {
	position: relative;
	height: 90%;
}

.add_to_do_popup_body .horizontal_bar {
	position: relative;
	border-bottom: 1px solid black;
	width: 95%;
	margin-left: auto;
	margin-right: auto;
}

.add_to_do_popup_dueDate {
	position: relative;
	margin-top: 5%;
	font-size: 20px;
	margin-left: auto;
	margin-right: auto;
	width: 300px;
}

.add_to_do_popup_dueDate input {
	position: relative;
	height: 30px;
	float: right;
}

.btn_wrapper {
	position: relative;
	margin-left: auto;
	margin-right: auto;
	margin-top: 60px;
	width: 250px;
}

.btn_wrapper button {
	position: relative;
	width: 100px;
}

.btn_wrapper .btn-danger {
	float: right;
}
</style>

<script>
	$(document)
			.ready(
					function() {

						$('#btn-new-story').click(
								function() {
									$('.new-entry').first().clone(true).css(
											'display', 'flex').appendTo(
											'#stories');
								});

						processEdited("entry");

						$('#btn-save').click(function() {
							processNew("new-entry");
							$('#stories').submit();

						});

						$('.add_to_do_popup').find('.btn-success').click(
								function() {
									$('.add_to_do_form').submit();
								});

						$('#checkAll')
								.click(
										function() {

											if ($('#checkAll').is(':checked')) {

												var entry = document
														.getElementsByClassName("entry");

												for (var i = 0; i < entry.length; i++) {
													$(entry)
															.eq(i)
															.children(
																	'.backlog-checkbox')
															.children(
																	'.checkbox')
															.prop('checked',
																	true);
												}
											} else {

												var entry = document
														.getElementsByClassName("entry");

												for (var i = 0; i < entry.length; i++) {
													$(entry)
															.eq(i)
															.children(
																	'.backlog-checkbox')
															.children(
																	'.checkbox')
															.prop('checked',
																	false);
												}
											}
										});

						showAlert();

						var button = document.getElementById("btn-new-story");

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
					});


	function processEdited(type) {
		var data = document.getElementsByClassName(type);

		var div = $(data).children("div");

		$(div).on('blur', function() {
			var div_content = $(this).text();

			var targetInput = $(this).next();

			var targetInputId = $(targetInput).attr('id');

			var newContent = div_content + "-" + targetInputId;

			$(targetInput).val(newContent);

		});

	}

	function processNew(type) {
		var new_entries = document.getElementsByClassName(type);
		var new_entries_content = $(new_entries).first().children("div");

		var new_entries_length = new_entries.length; //Rows
		var new_entries_content_length = new_entries_content.length; //Cols

		for (var i = 0; i < new_entries_length; i++)
		{
			var divs = $(new_entries).eq(i).children("div");
			var inputs = $(new_entries).eq(i).children("input");
			for (var j = 0; j < inputs.length; j++) {
				var div_className = $(divs).eq(j + 1).attr('class');
				var div_content = $(divs).eq(j + 1).text();
				var input_name = $(inputs).eq(j).attr('name');
				$(inputs).eq(j).val(div_content);
			}

		}

	}

	function showAlert() {

		var status = document.getElementsByClassName("hidden")[0];
		var statusString = $(status).text();
		if (statusString == "saved") {
			$(".alert-saved").addClass("in");
			window.setTimeout(function() {
				$(".alert-saved").fadeOut("slow", function() {
					$(this).remove();
				});
			}, 2000);
		}
		$(status).text("");
	}

	function show_popup(popup, obj) {
		document.getElementsByClassName(popup)[0].style.display = "block";
		var story_content = $(obj).parent().next().text();
		$(".add_to_do_popup_storyTitle").text("\"" + story_content + "\"");
		$("input[name=IDtoAdd]").val(obj.id);
	}

	function hide_popup(popup) {
		document.getElementsByClassName(popup)[0].style.display = "none";
	}
</script>

</head>
<body>

	<div class="hidden">${status}</div>

	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<span class="navbar-brand"><span class="label label-default">Project
				| Space</span></span> <span id="header" class="navbar-brand">${current_projectName}</span>

		<div class="name_logout_div">
			<div class="txt_welcome"><%=session.getAttribute("uname")%></div>
			<div id="btn_logout" class="btn-group">
				<form name="logout_form" action="Logout_Controller" method="GET">
					<button type="submit" class="btn btn-danger">
						<span class="glyphicon glyphicon-log-out"></span>
					</button>
				</form>
			</div>
		</div>

		<div class="collapse navbar-collapse navbar-items">
			<ul class="nav navbar-nav">
				<li><a href="DisplayProjects_Controller">Home</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Sprints<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<c:if test="${not empty sprintsList}">
							<c:forEach items="${sprintsList}" var="item">
								<li><a
									href="Display_Sprint_Controller?method=GET&sprint=${item}">${item}</a></li>
							</c:forEach>
						</c:if>
					</ul></li>
				<li><a href="GetChartData_Controller">Charts</a></li>
				<li><a href="Display_Backlog_Controller?method=GET">Backlog</a></li>
			</ul>
		</div>

	</div>
	</nav>

	<div class="body-container">

		<div class="alert alert-success fade alert-saved">Saved.</div>

		<div class="menu-bar">
			<div class="menu-header">
				<div class="subtitle">Backlog</div>
				<div class="total-hours">
					Expected Hours: <span>${totalHours}</span>
				</div>
				<div class="completed-hours">
					Completed Hours: <span>${completedHours}</span>
				</div>
			</div>
			<div class="menu-buttons">
				<button type="submit" class="btn btn-default btn-delete"
					id="btn-delete" form="stories" name="buttonDelete">
					<span class="glyphicon glyphicon-trash"></span>
				</button>
				<button type="submit" class="btn btn-default btn-delete"
					id="btn-save" form="stories" name="buttonSave">
					<span class="glyphicon glyphicon-floppy-save"></span>
				</button>
			</div>
		</div>

		<div class="sprint-backlog">
			<div class="backlog-title">
				<div class="backlog-checkbox">
					<input type="checkbox" class="checkbox" id="checkAll">
				</div>
				<div class="backlog-story">Task</div>
				<div class="backlog-hours">Hours</div>
				<div class="backlog-priority">Priority</div>
				<div class="backlog-notes">Notes</div>
				<div class="backlog-status">Status</div>
				<div class="backlog-sprint">Sprint</div>
			</div>

			<div class="backlog-body">
				<form id="stories" method="POST" action="Save_Backlog_Controller">

					<c:if test="${not empty backlog}">
						<c:forEach items="${backlog}" var="item">
							<div class="entry" id="${item[6]}">
								<div class="backlog-checkbox">
									<input type="checkbox" class="checkbox" name="backlog-checkbox"
										value="${item[6]}">
								</div>
								<div class="backlog-story">${item[0]}</div>
								<input type="text" name="backlog-story" id="${item[6]}">
								<div class="backlog-hours">${item[1]}</div>
								<input type="text" name="backlog-hours" id="${item[6]}">
								<div class="backlog-priority">${item[2]}</div>
								<input type="text" name="backlog-priority" id="${item[6]}">
								<div class="backlog-notes">${item[3]}</div>
								<input type="text" name="backlog-notes" id="${item[6]}">
								<div class="backlog-status">${item[4]}</div>
								<input type="text" name="backlog-status" id="${item[6]}">
								<div class="backlog-sprint">${item[5]}</div>
								<input type="text" name="backlog-sprint" id="${item[6]}">
							</div>


						</c:forEach>
					</c:if>

					<div class="new-entry">
						<div class="backlog-checkbox"></div>
						<div class="entry-story"></div>
						<input type="text" name="entry-story">
						<div class="entry-hours">0</div>
						<input type="text" name="entry-hours">
						<div class="entry-priority"></div>
						<input type="text" name="entry-priority">
						<div class="entry-notes"></div>
						<input type="text" name="entry-notes">
						<div class="entry-status">Not Started</div>
						<input type="text" name="entry-status">
						<div class="entry-sprint"></div>
						<input type="text" name="entry-sprint">
					</div>

				</form>
			</div>
		</div>

		<button type="button" class="btn btn-primary" id="btn-new-story">+</button>

	</div>

	<div class="add_to_do_popup">
		<div class="add_to_do_popup_title">Mark to do</div>
		<div class="add_to_do_popup_body">
			<form name="add_to_do_form" action="Add_To_Do_Controller"
				method="POST" onSubmit="hide_popup('add_to_do_popup')">

				<div class="add_to_do_popup_storyTitle"></div>
				<div class="horizontal_bar"></div>
				<div class="add_to_do_popup_dueDate">
					Due date: <input type="date" name="dueDate" class="dueDate"
						placeholder="mm-dd-yyy">
				</div>
				<div class="btn_wrapper">
					<button type="submit" class="btn btn-success">Ok</button>
					<button type="button" class="btn btn-danger"
						onClick="hide_popup('add_to_do_popup')">Cancel</button>
				</div>

				<input class="hidden" name="IDtoAdd">
			</form>
		</div>
	</div>

</body>
</html>