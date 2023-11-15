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
	h1 {
	    display: block;
	    font-size: 2em;
	    margin-block-start: 0.67em;
	    margin-block-end: 0.67em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    font-weight: bold;
	}
	.lm {
		height:100%;
		float:right;
		cursor:pointer;
		height : 60px;
		margin-left : 10px;
	}
	.im {
		height:100%;
		float:right;
		height : 60px;
		margin-left : 10px;
	}
	
	.lm > h3, .im > h3{
		margin-top : 30px;
		border : 1px solid red;
	}
	.lm {
		border : 1px solid red;
	}

</style>
</head>
<body>
	<div id="menubar">
		<div class="menu" onclick="location.href='book'"><h1>BOOK</h1></div>
		<div class="menu" onclick="location.href='event'"><h1>EVENT</h1></div>
		<div class="menu" onclick="location.href='challenge'"><h1>CHALLENGE</h1></div>
		<div class="menu" onclick="location.href='product'"><h1>PRODUCT</h1> </div>
		<div class="menu"><h1>MOVE</h1></div>
		<c:choose>
			<c:when test="${ empty sessionScope.loginUser }">
				<div class="lm login-menu" onclick="location.href='login'"><h1>LOGIN</h1> </div>
			</c:when>
			<c:otherwise>
				<div>
					<div class="lm login-menu" onclick="location.href='logout.us'"><h3>LOGOUT</h3> </div>
					<div class="lm login-menu" onclick="location.href='mypage.us'"><h3>MYPAGE</h3> </div>
					<div class="im">
						<h3>${ sessionScope.loginUser.userName }님 환영합니다</h3>
		            </div>
	            </div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>