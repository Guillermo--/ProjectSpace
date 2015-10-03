<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
	
	<title>Welcome! | ProjectSpace</title>

	<style>
		body
		{
			margin: 0;
			padding: 0;
		}

		#section-1
		{
		
			position: absolute;
			width: 100%;
			z-index: 9999;
			top: 0px;
	        
		}
		#section-1-image
		{
			
			position: relative;
			
			background-image:url("Cover.jpg");
	        background-size: cover;
	        -webkit-background-size: cover;
	        -moz-background-size: cover;
	        -o-background-size: cover;
	        
	        margin: 0;
	        padding: 0;
	        height: 950px;
	        display: block;
	        z-index: 1;
	        
		}
		#section-2
		{
			position: relative;
			height:650px;
			
		}
		
		#section-3
		{
			position: relative;
			height: 700px;
			
			background-image: -ms-linear-gradient(bottom, #000000 0%, #0E494F 100%);
			background-image: -moz-linear-gradient(bottom, #000000 0%, #0E494F 100%);
			background-image: -o-linear-gradient(bottom, #000000 0%, #0E494F 100%);
			background-image: -webkit-gradient(linear, left bottom, left top, color-stop(0, #000000), color-stop(1, #0E494F));
			background-image: -webkit-linear-gradient(bottom, #000000 0%, #0E494F 100%);
			background-image: linear-gradient(to top, #000000 0%, #0E494F 100%);
	
		}
	
		.header-div
		{
			text-align: center;
			padding-top: 50px;
			margin-bottom: 60px;
			font-weight: bold;
			font-size: 75px;
			color: #f2f2e9;
		}
		
		.login-div
		{
			position: relative;
			border: 2px solid #f2f2e9;
			border-radius: 20px;
			float: right;
			width: 500px;
			height: 350px;
			padding: 20px;
			margin-right: 10%;
			margin-top:50px;
			text-align: center;
			
		}
		.login-div > :first-child
		{
			font-size: 25px;
			color: #f2f2e9;
		}
		.login-div .input-group
		{
			position: relative;
			margin-top:20px;
		}
		
		.login-div .btn-success
		{
			margin-top: 40px;
			width: 100px;
		}
		
		.introduction-div
		{
			position: relative;
			float: left;
			margin-top: 130px;
			margin-left: 10%;
			width: 580px;
			color: #f2f2e9;
			
		}
		
		.introduction-div span
		{
			position: relative;
			display: block;
			font-size: 35px;
		}
		
		.introduction-div .btn-group-lg
		{
			position: relative;
			margin-top: 50px;
			margin-left: 80px;
			margin-right: 10px;
			margin-bottom: 30px;
			display: inline-block;
			
		}
		
		.btn-intro
		{
			width: 140px;
			border: 2px solid #f2f2e9;
			background: none;
			height: 50px;
			font-weight: bold;
			font-size: 20px;
		}
		
		.btn-intro:hover
		{
			background: #14141F;
		}
		
		#section-2 .s2-text
		{
			position:relative;
			margin-top: 50px;
			font-size: 25px;
			width: 900px;
			margin-left: auto;
			margin-right: auto;

		}
		
		#section-2 .s2-images
		{
			position: relative;
			margin-top: 150px;
			width: 90%;
			margin-left: auto;
			margin-right: auto;
		}
		
		.c1
		{
			position: relative;
		}
		
		.c2
		{
			position: relative;
			margin-left: 28%;

		}
		
		.c3
		{
			position: relative;
			float: right;
		}
		
		.img-circle
		{
			position: relative;
			height: 250px;
			width: 250px;
		}
		
		#section-3 #s3-title
		{
			position:relative;
			padding-top: 50px;
			margin-bottom:50px;
			text-align:center;
			font-size: 30px;
			font-weight: bold;
			color: #f2f2e9;
		}
		.signup-div
		{
			position:relative;
			height: 400px;
			width: 500px;
			border: 2px solid #f2f2e9;
			border-radius: 20px;
			padding: 20px;
			margin: auto;
			text-align: center;
			color: #f2f2e9;
			
		}
		
		.signup-div > :first-child
		{
			font-size: 25px;
		}
		
		.signup-div .btn-success
		{
			position:relative;
			margin-top: 40px;
			width: 100px;
		}
		
		.signup-div .input-group
		{
			position:relative;
			margin-top: 20px;
		}
		
		.error-msge
		{
			position: relative;
			color: #f2f2e9;
			font-style: oblique;
			font-size: 17px;
			background: #AD3333;
			border-radius: 10px;
			width: 300px;
			height: 30px;
			padding: 4px;
			margin-left: auto;
			margin-right: auto;
			margin-top: 25px;
		}
		
		.input-group input
		{
			height: 40px;
			font-size: 18px;
		}
		


		


	
	</style>
</head>

<body>
	
	<div id="section-1-image"></div>
	
	<div id="section-1">
		<div class="header-div">
			Project | Space
		</div>
		
		<div class="introduction-div">
			<span>A place where you can manage your software development projects.</span>
			<div class="btn-group-lg">
		  		<button type="button" class="btn-intro">About</button>
		  	</div>
		  	
		  	<div class="btn-group-lg">
		  		<button type="button" class="btn-intro">Join</button>
		  	</div>
	  	</div>
		
		<div class="login-div">
			<span>Login</span>
			<form name="login-form" method="POST" action="Login_Controller">
				<div class="input-group">
		  			<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
		  			<input type="text" name="user" class="form-control" placeholder="Username" required>
				</div>
				<div class="input-group">
		  			<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
		  			<input type="password" name="password" class="form-control" placeholder="Password" required>
				</div>
				
				 <div class="btn-group">
		  			<button type="submit" class="btn btn-success btn-lg">Go!</button>
		  		</div>
		  		
		  	
	  			<c:if test="${not empty error_login}">
	  				<div class="error-msge">
	  					${error_login}
	  				</div>
	  			</c:if>
		  		
		  	</form>
		</div>
	</div>
	
	<div id="section-2">
		<div class="s2-text">
			<p>Project Space allows users to keep track of their software development projects 
			by making use of the Agile methodology.</p>
			<p>...More coming soon!</p>
		</div>
		
		<div class="s2-images">
			<img src="placeholder.jpg" alt="Backlog" class="c1 img-circle">
			<img src="placeholder.jpg" alt="Burndow" class="c2 img-circle">
			<img src="placeholder.jpg" alt="Sprints" class="c3 img-circle">
		</div>	
		
	</div>
	
	<div id="section-3">
		<div id="s3-title">Like what you see?</div>
		
		<div class="signup-div">
			<span>Join!</span>
			<form name="signup-form" action="Join" method="POST">
				<div class="input-group">
		  			<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
		  			<input type="text" name="user" class="form-control" placeholder="Username" required>
				</div>
				
				<div class="input-group">
		  			<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
		  			<input type="password" name="password-1" class="form-control" placeholder="Password" required>
				</div>
				
				<div class="input-group">
		  			<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
		  			<input type="password" name="password-2" class="form-control" placeholder="Re-enter Password" required>
				</div>
				
				 <div class="btn-group">
		  			<button type="submit" class="btn btn-success btn-lg">Join!</button>
		  		</div>
		  		
		  		
	  			<c:if test="${not empty error_join}">
	  				<div class="error-msge">
	  					${error_join}
	  				</div>
	  			</c:if>
		  		
			</form>
		</div>
	</div>
	
	
	

</body>
</html>