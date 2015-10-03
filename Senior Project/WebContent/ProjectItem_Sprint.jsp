<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	

	<title>${current_projectName} | ProjectSpace</title>
	
	<style >
	
		body
		{
			margin: 0;
			padding: 0;
			background: #eceff1;
			overflow-x: hidden;
		}
		.navbar
		{
			min-width: 1900px;
			background:#455a64;
			border: none;
			border-radius: 0%;
			box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
		}
		.body-container
		{
			min-width: 1900px;
		}
		.label-default
		{
			position: relative;
			vertical-align: middle;
			font-size: 20px;
			background:#303F46;
			font-family: 'Roboto', sans-serif;
			font-weight: 300;
		}
		
		#header
		{
			position: relative;
			font-size: 30px;
			font-weight: bold;
			color: white;
			font-family: 'Roboto', sans-serif;
			font-weight: 400;
		}
		
		.name_logout_div
		{
			position: relative;
			float: right;
			margin-top: 10px;
		}
		.txt_welcome
		{
			position: relative;
			font-size: 18px;
			margin-right: 15px;
			float: left;
			margin-top: 5px;
			color: white;
			font-family: 'Roboto', sans-serif;
			font-weight: 300;
		}
		#btn_logout
		{
			position: relative;
			float: right;
		}
		
		#btn_logout button
		{
			font-size: 18px;
			height: 30px;
			width: 40px;
			padding: 5px;
			background: none;
			border-radius: 0%;
			border: none;
			box-shadow: none;
		}	
		
		#btn_logout button:hover
		{
			background: #2F3E44;
		}

		
	  	.navbar-default .navbar-nav > li > a 
	  	{
	  		color: white; 
	  		font-family: 'Roboto', sans-serif;
			font-weight: 300;
	    }
	   	.navbar-default .navbar-nav > li:hover
	    {
			background: white;
	    }
		.navbar-items
		{
			position: absolute;
			font-size: 20px;
			left: 50%;
		}
	
		.menu-div
		{
			position: absolute;
			width: 100%;
			height: 33%;
			top: 50px;
			z-index: 0;
			background: #607d8b;
			box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
			font-family: 'Roboto', sans-serif;
			font-weight: 300;
		}
		
		.menu-header
		{
			color: white;
			position: relative;
			font-family: 'Roboto', sans-serif;
			font-weight: 300;
			min-width: 40%;
			height: 30%;
			display: inline-block;
			margin-top: 3%;
			margin-left: 5%;	

		}
		
		.menu-header .subtitle
		{
			position: absolute;
			height: 80%;
			width: 25%;
			border-right: 2px solid white;
			display: inline-block;
			font-size: 50px;
			text-align: center;
			font-weight: 300;
			padding-top: 0.5%;
		}
		
		.completed-hours span, .total-hours span
		{
			font-size: 20px;
		}
		.completed-hours, .total-hours, .due-date, .start-date
		{
			position: absolute;
			left: 28%;
			min-width: 25%;
			font-size: 18px;
		}
		.start-date
		{
			top: 1%;
			height: 40%
		}
		.due-date
		{
			top: 40%;
			height:40%;
		}
		.total-hours
		{
			top: 1%;
			left: 65%;
			height:40%;
			padding-top: 3px;
		}
		.completed-hours
		{
			top: 40%;
			left: 65%;
			height:40%;
			padding-top: 3px;
		}
	
		
		.menu-div .menu-buttons button
		{
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
		.menu-div .menu-buttons
		{
			position: relative;
			float: right;
			margin-right: 8%;
			vertical-align: middle;
			margin-top: 5%;

		}
		
		#btn-change-table-right
		{
			display: none;
		}
				
		.menu-div button:hover
		{
			background: #435861;
			color: white;
		}


		.due-date #deliver-by, .start-date #start-by
		{
			position: relative;
			float: left;
			margin-top: 6px;
		}
		.date
		{
			position: relative;
			float: right;
			margin-right: 5px;
		}
		.date input
		{
			font-size: 18px;		
			margin-left: 10px;
			border: none;
			border-bottom: 1px solid white;
			background: none;
			outline: none;
			box-shadow: none;
			color: white;
			height: 30px;
			padding-right: 0px;
		}
		
		input[type=date]::-webkit-inner-spin-button 
		{
   	 		-webkit-appearance: none;
   			display: none;
		}
		input[type=date]::-webkit-clear-button
		{
		    display: none; /* Hide the button */
		    -webkit-appearance: none; /* turn off default browser styling */
		}
		
		.dateDisplay
		{
			position: relative;
			float: right;
			margin-left: 10px;
			font-size: 20px;
			min-width: 200px;
			display: none;
			padding-top: -2px;
		}
		
		.dateDisplay div, .dateDisplay button
		{
			position: relative;
			display: inline-block;
		}
		
		.dateDisplay button
		{
			border-radius: 0%;
			margin-left: 10px;
			width: 30px;
			height: 30px;
			background: none;
			color: white;
			border:none;
			padding-bottom: 8px;
			padding-left: 7px;
			box-shadow: none;
			font-size: 16px;
		}

		
		.dateDisplay div
		{
			margin-top: 1px;
			vertical-align: middle;
		}
		
		.sprint-backlog
		{
			position: relative;
			min-width: 1600px;
			width: 1600px;
			box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
			margin-left: auto;
			margin-right: auto;
			margin-top: 9.5%;
			margin-bottom: 40px;
			z-index: 0;
		}
		
		.backlog-title
		{
			display: flex;
		}
		.backlog-title div
		{
			position: relative;
			display: inline-block;
			text-align: center;
			padding: 10px;
			font-size: 18px;
			border: white;
			background: #00bfa5;
			color: white;
			font-weight: bold;
			flex: 1 auto;
			-webkit-user-modify: read-only;
			font-family: 'Roboto', sans-serif;
			font-weight: 400;
		}
		.backlog-checkbox .checkbox
		{
			display: block;
			margin-top: 6px;
			margin-left: 5px;
			float: left;
			width: 15px;
			height: 15px;
			cursor: pointer;
			vertical-align: middle;
		}
		.checkbox:before 
		{
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
		
		 
		
		.checkbox:checked:before 
		{
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
		
		.checkbox:after 
		{
		  content: "";
		  position: absolute;
		  top: 0;
		  left: 0;
		  width: 18px;
		  height: 18px;
		  background: #fff;
		  cursor: pointer;
		}
		.backlog-title .checkbox:after
		{
			background: #00bfa5;
		}
		
		.backlog-title .checkbox:checked:before 
		{
			border-color: white;
		}
		
		.backlog-checkbox button
		{
			display: block;
			float: right;
			background: white;
			width: 30px;
			height: 30px;
			border: 1px solid black;
			border-radius: 0%;
			font-size: 18px;
			padding-left: 6px;
			padding-top: 5px;
			border: none;
			box-shadow: none;
			vertical-align: middle;
			text-align: center;
			color: #B6B6AF;
			outline: none;
		}
		.backlog-checkbox
		{
			width: 95px;
			-webkit-user-modify: read-only;
			border-right: 1px solid #bdbdbd;
		}
		.backlog-story, .entry-story
		{
			width: 650px;
			-webkit-user-modify: read-write;
			border-right: 1px solid #bdbdbd;

		}
		.backlog-hours, .entry-hours
		{
			width: 65px;
			-webkit-user-modify: read-write;
			border-right: 1px solid #bdbdbd;
		}
		.backlog-hours-done, .entry-hours-done
		{
			width: 65px;
			-webkit-user-modify: read-only;
			border-right: 1px solid #bdbdbd;
		}
		.backlog-body .backlog-hours-done:hover
		{
			background:#EBEBE0;
			cursor: pointer;
		}
		.backlog-priority, .entry-priority
		{
			width:100px; 
			-webkit-user-modify: read-write;
			border-right: 1px solid #bdbdbd;
		}
		.backlog-owner, .entry-owner
		{
			width:100px;
			-webkit-user-modify: read-write;
			border-right: 1px solid #bdbdbd;
		}
		
		.backlog-notes, .entry-notes
		{
			width: 400px;
			-webkit-user-modify: read-write;
			border-right: 1px solid #bdbdbd;
		}
		.backlog-status, .entry-status
		{
			width: 200px;
			-webkit-user-modify: read-write;
		}
		.entry div
		{
			position: relative;
			text-align: center;
			font-size: 15px;
			word-wrap: break-word;
			vertical-align: middle;
			flex: 1 auto;
			padding: 10px;
			padding-bottom: 5px;
			border-top: 1px solid #bdbdbd;
			z-index: 3;
			background: white;
			font-family: 'Roboto', sans-serif;
			font-weight: 300;

		}
		.entry div:focus, .new-entry div:focus
		{
			background:	#EBEBE0;
			outline: none;
		}
		
		.entry
		{
			position: relative;
			display: flex;
		}

		.new-entry div
		{
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

		.new-entry
		{
			position: relative;
			display: none;
		}
		
		.new-entry input, .entry input
		{
			display: none;
		}
		
		#btn-new-story
		{
			position: fixed;
			top: 85%;
			left: 1800px;
			border-radius: 50%;
			border: none;
			width: 70px;
			height: 70px;
			font-size: 50px;
			text-align: center;
			z-index: 1px;
			outline: none;
			box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
			background: #00bcd4;
			padding: 0px;
			font-family: 'Roboto', sans-serif;
			font-weight: 300;
		}
		
		::-webkit-scrollbar 
		{
	    	width: 10px;
		}
		 
		/* Track */
		::-webkit-scrollbar-track 
		{
		    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
		    -webkit-border-radius: 8px;
		    border-radius: 8px;
		}
		 
		/* Handle */
		::-webkit-scrollbar-thumb 
		{
		    -webkit-border-radius: 8px;
		    border-radius: 8px;
		    background: #8F8F7D; 
		    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5); 
		}
		::-webkit-scrollbar-thumb:window-inactive 
		{
			background: rgba(255,0,0,0.4); 
		}
		.alert-saved
		{
			position: absolute;
			width: 240px;
			left: 2%;
			top: 92%;
			text-align: left;
			background: #455a64;
			color: white;
			border: none;
			border-radius: 0%;
			box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
			z-index: 999;
			font-family: 'Roboto', sans-serif;
			font-weight: 300;
		}
		.hidden
		{
			display: none;
		}
		.add_to_do_popup
		{
			position: absolute;
			z-index: 10001;
			display: none;
			width: 30%;
			height: 40%;
		    top:20%;
     		left:45%;
    	 	margin:-100px 0 0 -150px;
    	 	background: white;
			box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
			font-family: 'Roboto', sans-serif;
			font-weight: 300;
		}
		.add_to_do_popup_title
		{
			position: relative;
			text-align: left;
			margin-left: 30px;
			font-size: 20px;
			color: black;
		    font-family: 'Roboto', sans-serif;
			font-weight: 500;
			margin-top:30px;
			padding-bottom: 10px;
		}
		
		.add_to_do_popup_storyTitle
		{
			position: relative;
			min-height: 40%;
			font-size: 18px;
			text-align: left;
			margin-left: 30px;
			width: 80%;
			margin-top: 15px;
			
		}
		.add_to_do_popup_body, .add_to_do_popup_body form
		{
			position: relative;
			height: 90%;
		}
		
		.add_to_do_popup_body .horizontal_bar
		{
		 	position: relative;
		 	border-bottom: 1px solid #bdbdbd;
		 	width: 95%;
		 	margin-left: auto;
		 	margin-right: auto;
		}
		
		.add_to_do_popup_dueDate
		{
			position: relative;
			margin-top: 5%;
			font-size: 20px;
			margin-left: 30px;
			width: 310px;
		}
		
		.add_to_do_popup_dueDate input
		{
			position: relative;
			height: 30px;
			float: right;
			background: none;
			border: none;
			box-shadow: none;
			border-bottom: 1px solid #009688;
			outline: none;
		}
		
		.btn_wrapper
		{
			position: relative;
			float: right;
			margin-right: 30px;
			margin-top: 60px;
			width: 250px;
		}
		
		.btn_wrapper button
		{
			position: relative;
			float: left;
			margin-left: 10px;
			width: 100px;
			border: none;
			background: white;
			border-radius: 0%;
			box-shadow: none;
			font-size: 20px;
			font-family: 'Roboto', sans-serif;
			font-weight: 500;
		}
		
		.btn_wrapper button:hover
		{
			color: #009688;
			background: none;
		}
		
		.btn_wrapper .btn-danger
		{
			float: right;
		}
		
		.backlog-calendar
		{
			position: absolute;
			width: 86%;
			left: 100%;
			top: 21%;
			z-index: 3;
			box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
		}
		
		.backlog-calendar-title
		{
			display:flex;
			min-width: 95%;
		}
		.backlog-calendar-title div
		{
			position: relative;
			background: #00bfa5;
			color: white;
			font-size: 18px;
			padding: 10px;
			text-align: center;
			display: inline-block;
			flex: 1 auto;
			-webkit-user-modify: read-only;
			font-family: 'Roboto', sans-serif;
			font-weight: 400;
		}
		.backlog-calendar-title .backlog-calendar-day
		{
			font-size: 12px;
			width: 3%;
		}
		.backlog-calendar-title .backlog-calendar-story
		{
			padding-top: 1.5%;
			width: 35%;
		}
		.backlog-calendar-title .backlog-hours-done
		{
			padding-top: 1.5%;
			min-width: 4.5%;
			font-size: 15px;
		}
		.backlog-calendar-body
		{
			min-width: 95%;
			
		}
		.calendar-entry
		{
			display: flex;
			min-width: 95%px;
		}
		.calendar-entry div
		{
			position: relative;
			text-align: center;
			font-size: 15px;
			word-wrap: break-word;
			vertical-align: middle;
			flex: 1 auto;
			padding: 10px;
			border-top: 1px solid #bdbdbd;
			background: white;
			font-family: 'Roboto', sans-serif;
			font-weight: 300;
			background: white;
			outline: none;
		}
		.calendar-entry div:focus
		{
			background: #EBEBE0;
		}
		.calendar-entry .backlog-calendar-story
		{
			width: 35%;
			border-right: 1px solid #bdbdbd;
		}

		.calendar-entry .backlog-calendar-hours
		{
			width: 3%;
			-webkit-user-modify: read-write;
			border-right: 1px solid #bdbdbd;
		}
		.calendar-entry .backlog-calendar-completed
		{
			min-width: 4.5%;

		}

		.blur-background
		{
			position: absolute;
			display: none;
			width: 100%;
			height: 100%;
			background:rgba(92, 92, 92, 0.6);
			filter: blur(5px);
			z-index: 1000;
		}
		
		.add_hours_popup
		{
			position: absolute;
			top: 30%;
			left: 60%;
			height: 24%;
			width: 20%;
			border: none;
			background: white;
			z-index: 1001;
			padding-left: 25px;
			padding-right: 25px;
			box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
			font-family: 'Roboto', sans-serif;
			display: none;
		}
		.add_hours_popup_title
		{
			position: relative;
			text-align: left;
			font-size: 20px;
			color: black;
			padding-top: 15px;
			padding-bottom: 10px;
			font-family: 'Roboto', sans-serif;
			font-weight: 400;
			height: 20%;
			width: 100%;
			
		}
		.add_hours_popup_body
		{
			width: 100%;
			height: 80%;
			position: relative;


		}
		.add_hours_popup_body form
		{
			width: 100%;
			height: 100%;
			position: relative;

		}
		.add_hours_popup_body .add_hours_popup_storyTitle
		{
			position: relative;
			padding-top: 2%;
			padding-bottom: 4%;
			height: 38%;
			overflow: hidden;
		}
		.add_hours_popup_body .add_hours_popup_hoursAmount
		{
			position: relative;
			padding-top: 3%;
			height: 30%;
		}
		.add_hours_popup_body .add_hours_popup_hoursAmount input
		{
			width: 50px;
			border: none;
			border-bottom: 1px solid #009688;
			padding-bottom: 0px;
			font-size: 18px;
			font-weight: 400;
			outline: none;
			text-align: center;
			
		}
		.add_hours_popup_body .add_hours_popup_footer
		{
			position: relative;
			height: 30%;
			padding-top: 3%;
		}
		
		.add_hours_popup_footer button
		{
			position: relative;
			height: 35px;
			width: 80px;
			background: none;
			box-shadow: none;
			border: none;
			outline: none;
			float: right;
			font-weight: 500;
			font-size: 18px;
			font-family: 'Roboto', sans-serif;
		}
		
		.add_hours_popup_footer button:hover
		{
			color: #009688;
			background: none;
		}
		
		.add_hours_popup_footer #btnOk
		{
			margin-right: 1%;
		}
		.add_hours_popup_footer #btnCancel
		{
			margin-right: -2%;
		}
		
	</style>
	<script>
	$(document).ready(function() 
	{
		
		$('#btn-new-story').click(function()
		{
			$('.new-entry').first().clone(true).css('display', 'flex').appendTo('.backlog-body');
		});
		
		processEdited("entry");
		processEdited("calendar-entry")
		
		$('#btn-save').click(function()
		{
			//Get all new-entry divs
			//For each one, get content in div, and copy to corresponding input
			
			//For divs obtained from DB, check for content change
			//Maybe we can save time by not going through all of them and re-saving them
			
			processNew("new-entry");
			$('#stories').submit();
			
		});	
		
		formatDateDisplay();
		
		//Fix
		$('.btn-calendar').click(function()
		{
			//Go two parents up to find parent
			//Work with the div children of the parent 
			
			var parent = $(this).parents().eq(1);
			
			
			var toHide = $(parent).children('.dateDisplay')[0];
			var toShow = $(parent).children('.date')[0];
			
			$(toHide).css('display', 'none');
			$(toShow).css('display', 'block');
		});
		
		$('.add_to_do_popup').find('.btn-success').click(function()
		{
			$('.add_to_do_form').submit();
		});
		
		
		$('#checkAll').click(function()
		{
			
			if($('#checkAll').is(':checked'))
			{
	
				var entry = document.getElementsByClassName("entry");
				
				for(var i = 0; i<entry.length;i++)
				{
					$(entry).eq(i).children('.backlog-checkbox').children('.checkbox').prop('checked', true);
				}
			}
			else
			{
		
				var entry = document.getElementsByClassName("entry");
				
				for(var i = 0; i<entry.length;i++)
				{
					$(entry).eq(i).children('.backlog-checkbox').children('.checkbox').prop('checked', false);
				}
			}
		});
		
		showAlert();
		isSetComingUp();
		
		$('.btn-slide-table').click(function()
		{
			var mainTable = document.getElementsByClassName("sprint-backlog")[0];
			var secondaryTable = document.getElementsByClassName("backlog-calendar")[0];

			if($(this).attr('id') == "btn-change-table-left")
			{
				$(mainTable).css('transform', 'translateY(-1px)');
				$(mainTable).css('box-shadow', '0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23)');
				$(mainTable).animate({right: '100%'}, 1500);
				$(secondaryTable).animate({left: '7%'}, 2000);
				$(this).css('display', 'none');
				$('#btn-change-table-right').css('display', 'inline-block');
				
				setTimeout(function()
				{
					$(secondaryTable).css('transform', 'translateY(0px)');
					$(secondaryTable).css('box-shadow', '0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23)');
				
				}, 2000);

			}
			else
			{
				$(secondaryTable).css('transform', 'translateY(-1px)');
				$(secondaryTable).css('box-shadow', '0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23)');
				$(secondaryTable).animate({left: '100%'}, 1500);
				$(mainTable).animate({right: '0%'}, 2000);
				$(this).css('display', 'none');
				$('#btn-change-table-left').css('display', 'inline-block');
				
				setTimeout(function()
				{
					$(mainTable).css('transform', 'translateY(0px)');
					$(mainTable).css('box-shadow', '0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23)');

				}, 2000);
			}		
		});
		
		var button = document.getElementById("btn-new-story");
		
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
	
	
	//Write JS function that only processes edited rows
	//Change input value to bethe content and id of row, to know which row to update
	function processEdited(type)
	{
		var data = document.getElementsByClassName(type);
		
		var div = $(data).children("div");
		
		$(div).on('blur', function()
		{	
			var div_content = $(this).text();
		
			var targetInput = $(this).next();

			var targetInputId = $(targetInput).attr('id');
			
			var newContent = div_content+"-"+targetInputId;

			$(targetInput).val(newContent);
		});
	}
	
	function processNew(type)
	{
		var new_entries = document.getElementsByClassName(type);
		var new_entries_content = $(new_entries).first().children("div");
		
		var new_entries_length = new_entries.length; //Rows
		var new_entries_content_length = new_entries_content.length; //Cols
		
		for(var i = 0; i<new_entries_length; i++)// This will only touch new entries
		{
			var divs = $(new_entries).eq(i).children("div");
			var inputs = $(new_entries).eq(i).children("input");
			
			//alert("Row: "+i+" Divs: "+divs.length+" Inputs: "+inputs.length);
			
			for(var j = 0; j<inputs.length; j++)
			{
				var div_className = $(divs).eq(j+1).attr('class');
				var div_content = $(divs).eq(j+1).text();
				
				//alert("Div class: "+div_className+" Content: "+div_content);
				
				var input_name = $(inputs).eq(j).attr('name');
				$(inputs).eq(j).val(div_content);
				
				//var input_val = $(inputs).eq(j).val();
			}
		}
	}
	
	function formatDateDisplay()
	{
		var editDateDiv = document.getElementsByClassName("date");
		
		for( var i = 0; i<editDateDiv.length; i++)
		{	
			var editDateInput = $(editDateDiv).eq(i).children("input");
			var date_content = $(editDateInput).val();
			
			if(date_content != "")
			{
				$(editDateDiv).eq(i).css('display', 'none');
				//Format date to mm-dd-yyyy
				var split = date_content.split("-");
				var newDate = split[1]+"-"+split[2]+"-"+split[0];
				
				var displayDate = document.getElementsByClassName("dateDisplay")[i];
				$(displayDate).css('display', 'block');
				
				var displayDateChild = $(displayDate).children("div");
	
				var id = $(displayDateChild).attr('id');
	
				$(displayDateChild).text(newDate); 
			}
		}			
	}
	
	function showAlert() 
	{	   
	   var status = document.getElementsByClassName("hidden")[0];
	   var statusString = $(status).text();
	   
	   if(statusString == "saved")
	   {	   
		   $(".alert-saved").addClass("in");
		   
		   window.setTimeout(function()
		   {
			    $(".alert-saved").fadeOut("slow", function()
			    {
			        $(this).remove(); 
			    });
			}, 2000);
	   }
	   
	   $(status).text("");	
	}
	
	function show_popup(popup, obj)
	{
		document.getElementsByClassName(popup)[0].style.display="block";
		document.getElementsByClassName('blur-background')[0].style.display="block";
		
		//Get story content to popup
		//Get storyID (button id) to input
		
		if(popup == "add_to_do_popup")
		{
			var story_content = $(obj).parent().next().text();			
			$(".add_to_do_popup_storyTitle").text("\""+story_content+"\"");
			$("input[name=add_to_do_popup_IDtoAdd]").val(obj.id);
		}
		else if (popup == "add_hours_popup")
		{
			var parent = $(obj).parent().find('.backlog-story');	
			var story_content = $(parent).text();
			$(".add_hours_popup_storyTitle").text("\""+story_content+"\"");
			$("input[name=add_hours_popup_IDtoAdd]").val(obj.id);
			
			//Get date to display on popup
			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth()+1; //January is 0!
			var yyyy = today.getFullYear();

			if(dd<10) 
			{
			    dd='0'+dd
			} 

			if(mm<10) 
			{
			    mm='0'+mm
			} 

			today = mm+'/'+dd+'/'+yyyy;
			
			$('.add_hours_popup_title').text(today);
		}
		
	}
	
	
	
	function hide_popup(popup)
	{
		document.getElementsByClassName(popup)[0].style.display="none";
		document.getElementsByClassName('blur-background')[0].style.display="none";
		
		//$('.add_to_do_popup').find('.dueDate').val("");
	}
	
	function isSetComingUp()
	{
		var body = document.getElementsByClassName("backlog-body")[0];
		var marked = $(body).children('.hidden');
	
		for(var i = 0; i<marked.length; i++)
		{
			var value = $(marked).eq(i).val();
			if(value == "true")
			{
				$(body).children('.entry').eq(i).children('.backlog-checkbox').children('.btn-to-do').css('color', "#00bfa5");
			}
		}	
	}
	
	function submitForms()
	{
		document.getElementById("stories").submit();
	}
	
	function show_add_hours_popup()
	{
		var clicked = document.getElements
		
	}
	
	</script>
	
</head>
<body>

	<div class="hidden">${status}</div>
	
	<div class="blur-background"></div>
	

	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<span class="navbar-brand"><span class="label label-default">Project | Space</span></span>
			<span id="header" class="navbar-brand">${current_projectName}</span>

			<div class="name_logout_div">
				<div class="txt_welcome"><%=session.getAttribute("uname")%></div>
				<div id="btn_logout" class="btn-group">
					<form name="logout_form" action="Logout_Controller" method="GET">
	  					<button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-log-out"></span></button>
					</form>				
				</div>
			</div>
			
			<div class="collapse navbar-collapse navbar-items" >
				<ul class="nav navbar-nav">	
					<li><a href="DisplayProjects_Controller">Home</a></li>
					<li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sprints<span class="caret"></span></a>
			          <ul class="dropdown-menu" role="menu">
			            <c:if test="${not empty sprintsList}">
							<c:forEach items="${sprintsList}" var="item">
								<li><a href="Display_Sprint_Controller?method=GET&sprint=${item}">${item}</a></li>
							</c:forEach>
						</c:if>
			          </ul>
			        </li>	
			        <li><a href="GetChartData_Controller">Charts</a></li>
			        <li><a href="Display_Backlog_Controller?method=GET">Backlog</a></li>		
	        	</ul>
	        </div>
			
		</div>
	</nav>
	
	<div class="form-group body-container">
		<div class="menu-div">
			<div class="menu-header">
				<div class="subtitle">${sprintTitle}</div>
				
				<div class="start-date">
					<span id="start-by">Start date: </span>
				    <div class="input-group date">
			      		<input name="startDate" type="date" class="form-control" form="stories" placeholder="mm-dd-yyyy" value="${startDate}">
					</div>
					<div class="dateDisplay">
						<div id="date-display"></div>
						<button id="btn-editDate" class="btn btn-default btn-calendar" type="button"><span class="glyphicon glyphicon-pencil"></span></button>
					</div>
				</div>	
				
				<div class="due-date">
					<span id="deliver-by">Deliver by: </span>					
				    <div class="input-group date" >
			      		<input name="dueDate" type="date" class="form-control" form="stories" placeholder="mm-dd-yyyy" value="${dueDate}">
					</div>
					<div class="dateDisplay">
						<div id="date-display"></div>
						<button id="btn-editDate" class="btn btn-default btn-calendar" type="button"><span class="glyphicon glyphicon-pencil"></span></button>
					</div>
				</div>	
				
				<div class="total-hours">Expected Hours: <span>${totalHours}</span></div>
				<div class="completed-hours">Completed Hours: <span>${completedHours}</span></div>
			</div>
			<div class="menu-buttons">
				<button type="submit" class="btn btn-default btn-delete" id="btn-delete" form="stories" name="buttonDelete"><span class="glyphicon glyphicon-trash"></span></button>
				<button type="button" class="btn btn-default btn-delete" id="btn-save" onClick="submitForms()" name="buttonSave"><span class="glyphicon glyphicon-floppy-save"></span></button>							
			</div>
		</div>
		
		<div class="alert alert-success fade alert-saved">
		   Saved.
		</div>
				
		<form id="stories" method="POST" action="Save_Sprint_Controller">	
			<div class="sprint-backlog">
				<div class="backlog-title">
					<div class="backlog-checkbox"><input type="checkbox" class="checkbox" id="checkAll"></div>
					<div class="backlog-story">Task</div>
					<div class="backlog-hours">Hours</div>
					<div class="backlog-hours-done">Done</div>
					<div class="backlog-priority">Priority</div>
					<div class="backlog-owner">Owner</div>
					<div class="backlog-notes">Notes</div>
					<div class="backlog-status">Status</div>
				</div>
		
				<div class="backlog-body">
					<c:if test="${not empty sprint}">
						<c:forEach items="${sprint}" var="item">
							<div class="entry" id="${item[7]}">
								<div class="backlog-checkbox">
									<input type="checkbox" class="checkbox" name="backlog-checkbox" value="${item[7]}">
									<button type="button" class="btn btn-default btn-to-do" id="${item[7]}" onClick="show_popup('add_to_do_popup', this)" name="buttonToDo"><span class="glyphicon glyphicon-tag"></span></button>
								</div>
								<div class="backlog-story">${item[0]}</div>
								<input type="text" name="backlog-story" id="${item[7]}">
								<div class="backlog-hours">${item[1]}</div>
								<input type="text" name="backlog-hours" id="${item[7]}">
								<div class="backlog-hours-done" onClick="show_popup('add_hours_popup', this)" id="${item[7]}">${item[2]}</div>
								<input type="text" name="backlog-hours-done" id="${item[7]}">
								<div class="backlog-priority">${item[3]}</div>
								<input type="text" name="backlog-priority" id="${item[7]}">
								<div class="backlog-owner">${item[4]}</div>
								<input type="text" name="backlog-owner" id="${item[7]}">
								<div class="backlog-notes">${item[5]}</div>
								<input type="text" name="backlog-notes" id="${item[7]}">
								<div class="backlog-status">${item[6]}</div>
								<input type="text" name="backlog-status" id="${item[7]}">
							</div>
							
							<input class="hidden" id="${item[7]}" value="${item[8]}">
							
						</c:forEach>
					</c:if>
					
					<div class="new-entry">
						<div class="backlog-checkbox">	
						</div>
						<div class="entry-story"></div>
						<input type="text" name="entry-story">
						<div class="entry-hours">0</div>
						<input type="text" name="entry-hours">
						<div class="entry-hours-done">0</div>
						<input type="text" name="entry-hours-done">
						<div class="entry-priority"></div>
						<input type="text" name="entry-priority">
						<div class="entry-owner"></div>
						<input type="text" name="entry-owner">
						<div class="entry-notes"></div>
						<input type="text" name="entry-notes">
						<div class="entry-status">Not Started</div>
						<input type="text" name="entry-status">
					</div>
				</div>
			</div>
			
			<div class="backlog-calendar">
				<div class="backlog-calendar-title">
					<div class="backlog-calendar-story">Task</div>
					<c:if test="${not empty days}">
						<c:forEach items="${days}" var="item">
							<div class="backlog-calendar-day">${item}</div>
						</c:forEach>
					</c:if>
					<div class="backlog-hours-done">Total</div>
				</div>
				
				<div class="backlog-calendar-body">
					<c:if test="${not empty storiesAndHours}">
						<c:forEach items="${storiesAndHours}" var="row">
							<div class="calendar-entry" id="${item[7]}">
								<div class="backlog-calendar-story">${row.key}</div>
								<c:if test="${not empty row.value}">
									<c:forEach items="${row.value[0]}" var="hourdate">
										<div class="backlog-calendar-hours" id="${item[7]}">${hourdate}</div>
										<input class="hidden" type="text" name="backlog-calendar-hours" id="${item[7]}">
										<input class="hidden" type="text" name="dates" value="${hourdate}">
										<input class="hidden" type="text" name="hours-id" value="${item[7]}">
									</c:forEach>
								</c:if>
								<div class="backlog-calendar-completed"></div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</form>
	
		<button type="button" class="btn btn-primary" id="btn-new-story">+</button>
	</div>
	
		<div class="add_to_do_popup">
		    <div class="add_to_do_popup_title">Mark to do</div>
		    <div class="add_to_do_popup_body">
	      		<form name="add_to_do_form" action="Add_To_Do_Controller" method="POST" onSubmit="hide_popup('add_to_do_popup')">					
					<div class="add_to_do_popup_storyTitle"></div>
					<div class="horizontal_bar"></div>
					<div class="add_to_do_popup_dueDate">Due date: <input type="date" name="dueDate" class="dueDate" placeholder="mm-dd-yyy"></div>
					<div class="btn_wrapper">
						<button type="submit" class="btn btn-default">Ok</button>
	  					<button type="button" class="btn btn-default" onClick="hide_popup('add_to_do_popup')">Cancel</button>
					</div>
					
					<input class="hidden" name="add_to_do_popup_IDtoAdd">
	  			</form>
		    </div>
	 	</div>
	 	
	 	<div class="add_hours_popup">
	 		<div class="add_hours_popup_title"></div>
	 		<div class="add_hours_popup_body">
	 			<form name="add_hours_form" action="Add_Hours_Controller" method="POST" onSubmit="hide_popup('add_hours_popup')">
	 				<div class="add_hours_popup_storyTitle"></div>
	 				<div class="add_hours_popup_hoursAmount">Add <input type="text" name="hours" autocomplete="off"> hours</div>
	 				<div class="add_hours_popup_footer">
	 					<button type="button" id ="btnCancel" class="btn btn-default" onClick="hide_popup('add_hours_popup')">Cancel</button>
 						<button type="submit" id="btnOk" class="btn btn-default">Ok</button>
					</div>
					
					<input class="hidden" name="add_hours_popup_IDtoAdd">
					
	 			</form>
	 		</div>
	 		
	 	</div>
</body>
</html>