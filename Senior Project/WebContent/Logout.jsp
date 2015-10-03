<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script src="http://jqueryrotate.googlecode.com/svn/trunk/jQueryRotate.js"></script>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<link href='http://fonts.googleapis.com/css?family=Roboto:500,400italic,100,700italic,300,700,500italic,100italic,300italic,400' rel='stylesheet' type='text/css'>

<title>Logged out</title>

<style>
		html
		{
			margin:0;
			border:0;
		}
		body
		{
			background: #455a64;

		}
		.title
		{
			position: relative;
			display: block;
			margin-top: 2%;
			font-size: 80px;
			margin-left: 5%;
			color: white;
			width: 90%;
			border-bottom: 1px solid #00bfa5;
			font-family: 'Roboto', sans-serif;
			font-weight: 200;
			
		}

		
		button
		{
			margin-top: 10%;
			margin-left: 37%;
			height: 60px;
			width: 500px;
			outline: none;
			border: none;
			box-shadow: none;
			positon: relative;
			box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);			
			background: #37474f;	
		}

		a
		{
			font-size: 30px;
			color: white;
			font-family: 'Roboto', sans-serif;
			font-weight: 200;	
			text-decoration: none;
		}
		a:hover
		{
			text-decoration: none;
			color: white;
		}
</style>

<script>
	$(document).ready(function()
	{
		var button = document.getElementsByClassName("go_back_btn");
		
		$(button).hover
		(
			function()
			{		
				$(button).css('transition', '0.5s');
				$(button).css('-webkit-transform','translateY(-2px)');
				$(button).css('box-shadow', '0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23)');
			},
			function()
			{
				$(button).css('transition', '0.5s');
				$(button).css('-webkit-transform','translateY(0px)');
				$(button).css('box-shadow', '0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23)');
			}			
		);
	});

</script>

</head>


<body>
	<div class="title">You have logged out successfully</div>
	<div class="message">
		<button class="go_back_btn" type="button"><a href="Welcome2.jsp">Back to login page<a/></button>
	</div>
</body>
</html>