<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>
	body {
		font-family: 'Noto Sans KR', sans-serif;
	}
	#menubar{
		width : 1200px;
		height : 60px;
		box-sizing : border-box;
		margin:auto;
		padding:0;
	}
	.menu
	{
		height:100%;
		float:left;
		width : 200px;
		cursor:pointer;
		margin:auto;
	}
</style>
</head>
<body>
	<div id="menubar">
		<div class="menu" onclick="location.href='book'"><h1>BOOK</h1></div>
		<div class="menu"><h1>CHALLENGE</h1></div>
		<div class="menu" onclick="location.href='product'"><h1>PRODUCT</h1> </div>
		<div class="menu"><h1>MOVE</h1></div>
		<div class="menu" onclick="location.href='login'"><h1>LOGIN</h1> </div>
	</div>
</body>
</html>