<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Directions on where to find the specific library -->

<!DOCTYPE html>
<html lang="en">
<head>

<!--==author: Ilia Garrett Bravard
	Date: 09/22/2022==-->

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Infix - Postfix</title>
<link rel="icon" href="1.png" type="image/x-icon">

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
	background: #191919;
	text-align: center;
	border-radius: 25px;
	background-image: url(2.png);
	background-size: 100% 90%;
}

.box:hover {
	border: 2px solid yellow;
}

.box h1 {
	color: white;
	text-transform: uppercase;
	font-weight: 500;
	font-size: 40px;
	color: yellow;
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
	background: rgb(135, 177, 255);
	border-style: dotted;
	font-size: 15px;
	color: white;
}

.padding {
	padding-top: 17px;
}
</style>
</head>

<body>
	<!-- Specifying the action and the method for processing the form -->
	<form name="form" class="box" action="getPostfixServlet" method="post"
		autocomplete=off target="_blank">
		<h1>Infix - Postfix Converter</h1>
		<p>An infix expression is the regular math expression we all know.
			For example, a + b or 1 + 2.</p>
		<p>We use precedence and read the equation from left to right in
			order to determine the solution.</p>
		<p>A postfix expression is one that the computer uses in order to
			solve it. For example, a + b will be represented as ab+</p>
		<p>The computer uses this converted equation because it is much
			more efficient and faster to solve the expression than using the
			algorithm that humans apply.</p>
		<p class="padding">Try It Out Below:</p>
		<input type="text" name="infix" placeholder="For example, (A+B)*C"><br>
		<input type="submit" value="Convert">
	</form>
</body>
</html>