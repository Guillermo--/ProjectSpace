<%@ page isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link href='http://fonts.googleapis.com/css?family=Roboto:500,400italic,100,700italic,300,700,500italic,100italic,300italic,400' rel='stylesheet' type='text/css'>
	
	<title>Page Not Found</title>
	
	<style>
		html
		{
			margin:0;
			border:0;
		}
		body
		{
			background: #455a64;
			height: 100%;
			width: 100%;
		}
		
		.title
		{
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
		
		.message
		{
			position: relative;
			margin-left: 5%;
			font-size: 30px;
			margin-top: 10%;
			width: 50%;
			height: 250px;
			float: left;
			clear: both;
			color: white;
			font-family: 'Roboto', sans-serif;
			font-weight: 300;

		}
		.message span
		{
			display: inline-block;
			
		}
		
		button
		{
			margin-left: 10%;
			height: 60px;
			width: 300px;
			outline: none;
			border: none;
			box-shadow: none;
			positon: relative;
			box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);			
			background: #37474f;	
			display: inline-block;
		}
		
		button:hover
		{
			-moz-transform: translateY(-2px);
		    -ms-transform: translateY(-2px);
		    -o-transform: translateY(-2px);
		    -webkit-transform: translateY(-2px);
		    transform: translateY(-2px);
		     box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
		
		}
		
		a
		{
			font-size: 30px;
			color: white;
			font-family: 'Roboto', sans-serif;
			font-weight: 200;	
			text-decoration: none;
		}
	
	</style>
</head>

<body>
	<div class="title">Error 500</div>
	<div class="message">
		<span>You must be logged in.</span>
		<button type="button"><a href="Welcome2.jsp">Login<a/></button>
	</div>

</body>

</html>