<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>

<!--==author: ilia garrett bravard
	date: 09/22/2022==-->

<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>infix solution</title>
<link rel="icon" href="1.jpg" type="image/x-icon">

<style>
body {
	margin: 0;
	padding: 0;
	color: white;
	font-family: lucida handwriting;
	background: rgb(107, 106, 106);
}

.box {
	padding: 15px;
	width: 60%;
	height: 90%;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: black;
	text-align: left;
	border-radius: 25px;
	background-image: url(4.png);
	background-size: 130% 100%;
	background-repeat: no-repeat;
}

.box h1 {
	color: white;
	text-transform: uppercase;
	font-weight: 500;
	font-size: 40px;
	text-align: center;
}

.box:hover {
	border: 2px solid yellow;
}

.box input[type="text"] {
	border: 0;
	background: white;
	display: block;
	margin: 15px auto;
	text-align: center;
	border: 2px solid #3498db;
	padding: 14px 10px;
	width: 200px;
	outline: none;
	color: black;
	border-radius: 24px;
	transition: 0.5s;
}

.box input[type="text"]:focus {
	width: 280px;
	border-color: rgb(231, 255, 145);
}

.box input[type="submit"] {
	border: 0;
	background: white;
	display: block;
	margin: 15px auto;
	text-align: center;
	border: 2px solid rgb(231, 255, 145);
	padding: 14px 40px;
	width: 185px;
	outline: none;
	color: black;
	border-radius: 50px;
	transition: 0.25s;
	cursor: pointer;
}

.box input[type="submit"]:hover {
	background: rgb(238, 159, 159);
	border-style: dotted;
	font-size: 15px;
	color: black;
}

.link1 {
	position: absolute;
	top: 80%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-decoration: none;
	text-transform: uppercase;
	background: #262626;
	width: 370px;
	height: 60px;
	line-height: 60px;
	color: #fff;
	padding: 0px 10px;
	letter-spacing: 5px;
	text-align: center;
	font-size: 20px;
	transition: 0.5;
	overflow: hidden;
	border-radius: 25px;
}

.link2 {
	position: absolute;
	top: 60%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-decoration: none;
	text-transform: uppercase;
	background: #262626;
	width: 370px;
	height: 60px;
	line-height: 60px;
	color: #fff;
	padding: 0px 10px;
	letter-spacing: 5px;
	text-align: center;
	font-size: 20px;
	transition: 0.5;
	overflow: hidden;
	border-radius: 25px;
}

a:before {
	content: '';
	position: absolute;
	bottom: 0;
	left: 0;
	width: 200px;
	height: 0;
	z-index: -1;
	transition: 1s;
	border-style: solid;
	border-color: #15b365;
	border-radius: 25px;
	border-width: 80px 100px;
	transform: rotate(360deg);
	transform-origin: top left
}

a:hover:before {
	border-color: #00f;
	transform: rotate(40deg);
	border-radius: 25px;
}

a:hover {
	color: #ff0;
	transition: 0.5s;
	transition-delay: 0.3s;
}
</style>
</head>
<body>
	<!-- specifying the action and the method for processing the form -->
	<form name="form" class="box" action="getpostfixservlet" method="post">
		<h1 style="font-size: 50px; color: yellow">infix solution</h1>
		<p style="font-size: 45px; text-align: center">
			the infix expression is <br>${iexpression.convertpostfix()}</p>
		<a class="link2" href="index1.jsp">try infix to postfix?</a> <a
			class="link1" href="index2.jsp">try postfix to infix?</a><br>
	</form>
</body>
</html>