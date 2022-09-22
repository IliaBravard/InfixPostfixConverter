<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>

<!--==author: Ilia Garrett Bravard
	Date: 09/22/2022==-->

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IP Converter #2</title>
<link rel="icon" href="1.jpg" type="image/x-icon">

<style>
body {
	margin: 0;
	padding: 0;
	color: white;
	font-family: Lucida Handwriting;
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
	background-image: url(3.png);
	background-size: 100% 100%;
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

.padding {
	padding-top: 30px;
	font-size: 23px;
}

.link1 {
	position: absolute;
	top: 70%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-decoration: none;
	text-transform: uppercase;
	background: #262626;
	width: 300px;
	height: 60px;
	line-height: 60px;
	color: #FFF;
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
	top: 85%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-decoration: none;
	text-transform: uppercase;
	background: #262626;
	width: 300px;
	height: 60px;
	line-height: 60px;
	color: #FFF;
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
	width: 0;
	height: 0;
	z-index: -1;
	transition: 1s;
	border-style: solid;
	border-color: #F00;
	border-radius: 25px;
	border-width: 80px 200px;
	transform: rotate(360deg);
	transform-origin: top left
}

a:hover:before {
	border-color: #00F;
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
	<!-- Specifying the action and the method for processing the form -->
	<form name="form" class="box" action="getPostfixServlet" method="post">
		<h1 style="color: yellow">Input Validation Error</h1>
		<ol class="padding">
			<li>The expression CANNOT contain any spaces! For example, a+b
				is OK, but a + b will not work.</li>
			<li>The only allowed brackets are rounded brackets! {} and []
				are not allowed.</li>
			<li>The only arithemtic operators allowed are +, -, *, and /! %
				and ^ are NOT compatible with the application.</li>
			<li>You must have at least one operator included in the
				application!</li>
		</ol>
		<a class="link1" href="index1.jsp">Infix to Postfix</a> <a
			class="link2" href="index2.jsp">Postfix to Infix</a>
	</form>
</body>
</html>