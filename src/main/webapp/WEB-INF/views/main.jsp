<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eco Friendly</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
	#menubar{
		width : 1200px;
		height : 60px;
		border : 2px solid darkgreen;
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
	#placeholder{
		width : 1200px;
		height : 800px;
		margin:auto;
	}
	#placeholder>img{
		width : 100%;
		height : 100%;
		opacity:0.8;
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
	<div id="placeholder">
	<img src="resources/images/cookieChunsik.jpg">
	
	</div>
	
	<script>
		$(()=>{
			$('.menu').hover(function(){
				$(this).css('color', 'red');
			}, function(){
				$(this).css('color', 'black');
			});
		})
	</script>
</body>
</html>