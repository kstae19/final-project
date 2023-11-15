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
	<jsp:include page="common/header.jsp" />
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
			$('.login-menu').hover(function(){
				$(this).css('color', 'red');
			}, function(){
				$(this).css('color', 'black');
			});
		})
	</script>
</body>
</html>