<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료!</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<style>
	#pay-info{
		width : 700px;
		height : 150px;
		margin:auto;
		background : lightpink;
	}
</style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>
	<br><br>
	<div id="pay-info">
		<h1>결제 성공!</h1>
		<h3>${itemName }의 결제가 성공적으로 완료되었습니다</h3>
		<a href="shoppingList?userNo=${sessionScope.loginUser.userNo }">결제 목록으로 이동하기</a>
	</div>



</body>
</html>