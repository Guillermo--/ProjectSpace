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
<script
	src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script
	src="http://jqueryrotate.googlecode.com/svn/trunk/jQueryRotate.js"></script>
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


<title>Charts | ProjectSpace</title>

<style>
html, body {
	margin: 0;
	padding: 0;
	background: #eceff1;
	overflow-x: hidden;
	height: 100%;
	width: 100%;
}

.navbar {
	min-width: 1900px;
	background: #455a64;
	border: none;
	border-radius: 0%;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	margin-bottom: 0px;
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
	font-weight: bold;
	color: white;
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
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

.navbar-default .navbar-nav>li>a {
	color: white;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

.navbar-default .navbar-nav>li:hover {
	background: white;
}

.navbar-items {
	position: absolute;
	font-size: 20px;
	left: 50%;
}

.container {
	margin-top: -9%;
	position: relative;
	width: 98%;
	padding-left: 10px;
}

.chartItem {
	position: relative;
	display: inline-block;
	margin-left: 3%;
	margin-bottom: 3%;
	height: 300px;
	width: 45%;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
	background: white;
}

.chartContainer {
	position: relative;
	height: 82%;
	width: 100%;
}

.chartTitle {
	position: relative;
	height: 18%;
	width: 100%;
	border: none;
}

.maximizeChart {
	position: absolute;
	display: block;
	background: none;
	height: 60%;
	width: 5%;
	left: 95%;
	top: 5%;
	border: none;
	outline: none;
}

.sprintName {
	position: absolute;
	display: inline-block;
	left: 2%;
	top: 10%;
	font-size: 30px;
	font-family: 'Roboto', sans-serif;
	font-weight: 300;
}

.menu-div {
	position: relative;
	width: 100%;
	height: 33%;
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
	font-size: 50px;
	text-align: center;
	font-weight: 300;
	padding-top: 0.5%;
}

.blur-background {
	position: absolute;
	display: none;
	width: 100%;
	height: 100%;
	background: rgba(92, 92, 92, 0.5);
	filter: blur(5px);
	z-index: 900;
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
</style>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	// Load the Visualization API and the piechart package.
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});

	// Set a callback to run when the Google Visualization API is loaded.
	google.setOnLoadCallback(setData);

	function setData() {
		//How do we differentiate the charts?
		var containers = document.getElementsByClassName("chartContainer");
		var counter = 0;

		<c:forEach items="${charts}" var="chartItem">
		var data = google.visualization.arrayToDataTable([
				[ 'Date', 'Actual', 'Ideal' ],
				<c:forEach items="${chartItem}" var="data">['${data.day}',
						parseInt('${data.actualHours}'),
						parseInt('${data.idealHours}')], </c:forEach> ]);

		var current = $(containers).eq(counter);
		var sprintNumber = counter + 1;
		//Set options
		var options = {
			backgroundColor : 'none',
			titleTextStyle : {
				color : 'black',
				fontName : 'Roboto',
				fontSize : 20
			},
			vAxis : {
				textStyle : {
					color : 'black',
					fontName : 'Roboto',
					bold : false,
					italic : false
				},
				titleTextStyle : {
					color : 'black',
					fontName : 'Roboto',
					fontSize : 15,
					bold : false,
					italic : false
				},
				minValue : 0,
				title : 'Remaining Hours',
				viewWindowMode : 'maximized'
			},
			hAxis : {
				textStyle : {
					color : 'black',
					fontName : 'Roboto',
					bold : false,
					italic : false
				},
				titleTextStyle : {
					color : 'black',
					fontName : 'Roboto',
					fontSize : 15,
					bold : false,
					italic : false
				},
				minValue : 0,
				title : 'Date',
				viewWindowMode : 'maximized',
				slantedText : true,
				baseline : 0
			},
			tooltip : {
				showColorCode : true
			},
			chartArea : {
				width : '80%',
				height : '60%',
				left : 75,
				top : 20
			},
			pointSize : 3,
			crosshair : {
				trigger : 'both',
				opacity : 0.4
			},
			series : {
				0 : {
					color : '#EF5350'
				},

				1 : {
					color : '#00bfa5'
				}
			}

		};

		new google.visualization.LineChart(document
				.getElementsByClassName("chartContainer")[counter]).draw(data,
				options);
		var chartTitle = document.getElementsByClassName("chartTitle")[counter];
		$(chartTitle).find('.sprintName').text("Sprint " + sprintNumber);

		counter = counter + 1;

		</c:forEach>

	}

	$(document)
			.ready(
					function() {
						var chartToMax = document
								.getElementsByClassName("maximizeChart");

						$(chartToMax)
								.hover(
										function() {
											var chart = $(this).parent()
													.parent().first();
											$(chart).css('transition', "0.5s");
											$(chart).css('-webkit-transform',
													'translateY(-2px)');
											$(chart)
													.css('box-shadow',
															'0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22)');
										},
										function() {
											var chart = $(this).parent()
													.parent().first();
											$(chart).css('-webkit-transform',
													'translateY(0px)');
											$(chart)
													.css('box-shadow',
															'0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23)');
										});

						$(chartToMax)
								.click(
										function() {
											var chart = $(this).parent()
													.parent().first();
											var chartContainer = $(chart)
													.parent();

											var clicked = $(this).children(
													"span").attr('class');

											var containerWidth = $(
													chartContainer)
													.css("width");
											var midPoint = parseInt(
													containerWidth, 10) / 2;

											var position = $(chart).offset();
											var left = position.left;
											var right = position.right;
											var top = position.top;


											if (clicked == "glyphicon glyphicon-resize-full") {

												if (midPoint > left)
												{
													$(chart).css("z-index",
															1000);
													$(chart)
															.css(
																	{
																		transition : "1s",
																		transform : 'translate(55%, 50%) scale(2, 2)'
																	});
													$(chartToMax)
															.children("span")
															.removeClass(
																	"glyphicon glyphicon-resize-full");
													$(chartToMax)
															.children("span")
															.addClass(
																	"glyphicon glyphicon-resize-small");

												} else if (midPoint < left)
												{
													$(chart).css("z-index",
															1000);
													$(chart)
															.css(
																	{
																		transition : "1s",
																		transform : 'translate(-55%, 50%) scale(2, 2)'
																	});
													$(chartToMax)
															.children("span")
															.removeClass(
																	"glyphicon glyphicon-resize-full");
													$(chartToMax)
															.children("span")
															.addClass(
																	"glyphicon glyphicon-resize-small");
												}

												setTimeout(function() {
													$('.blur-background').css({
														display : 'block'
													});
												}, 700);

											} else if (clicked == "glyphicon glyphicon-resize-small") {
												$(chart)
														.css(
																{
																	transition : "1s",
																	transform : 'translate(0%, 0%) scale(1, 1)',
																	"z-index" : 0
																});
												$(chartToMax)
														.children("span")
														.removeClass(
																"glyphicon glyphicon-resize-small");
												$(chartToMax)
														.children("span")
														.addClass(
																"glyphicon glyphicon-resize-full");
												$('.blur-background').css(
														'display', 'none');
											}
										});

					});
</script>



</head>

<body>

	<div class="blur-background"></div>

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
				<li><a href="#">Charts</a></li>
				<li><a href="Display_Backlog_Controller?method=GET">Backlog</a></li>
			</ul>
		</div>
	</div>
	</nav>


	<div class="menu-div">
		<div class="menu-header">
			<div class="subtitle">Charts</div>
		</div>
	</div>

	<div class="container">
		<c:forEach items="${charts}" var="chartItem">
			<div class="chartItem">
				<div class="chartTitle">
					<div class="sprintName"></div>
					<button class="maximizeChart">
						<span class="glyphicon glyphicon-resize-full"></span>
					</button>
				</div>
				<div class="chartContainer"></div>
			</div>
		</c:forEach>
	</div>



</body>
</html>