<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<style>
	div{
		border : 2px solid darkgreen;
		box-sizing: border-box;
	
	}
	
	#login-main {
		width : 1200px;
		height : 800px;
		margin: auto;
		background-color: #f7f2e9;
		
	}

	#login-user {
		height: 80%;
	}

	#regist-user { 
		height : 20%;
		margin: auto;
	}
	
	.login {
		width : 50%;
	}

	#login-user > div { 
		height : 100%;
	}

	#login-id, #login-sns{
		float: left;
	}
	
	.login > h1{
		font-weight: bold;
		margin-top : 150px;
		margin-bottom : 50px;
		text-align: center;
	}

	#regist > div{ 
		float: left;
	}

	#regist {
		text-align: center;
		line-height: 36px;
		width: 475px;
		height: 40px;
		margin: auto;
		margin-top: 20px;
	}

	#regist > div > h4 {
		font-weight: bold;
	}

	#bar {
		text-align: center;
		line-height: 36px;
		color : black;
		font-weight: bold;
	}
	
	.form-control, .btn {
		width: 350px;
		height : 50px;
	}
	
	.login-center {
		margin : auto;
		width : 353px;
	}
	
	#login-btn {
		font-size : 18px;
		margin-bottom : 10px;
	 }
	 
	 #sns-center {
	 	margin: auto;
	 	width : 232px;
	 }
	 
	 .sns-button > img {
	 	width : 230px;
	 	height : 60px;
	 	margin-top : 10px;
	 	margin-bottom : 10px;
	 }

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div id="login-main">
		<div id="login-user">
			<form action="login.us" method="post">
				<div id="login-id" class="login">
					<h1>로그인</h1>
					<div class="login-center">
						<input type="text" class="form-control mb-2 mr-sm-2" placeholder="아이디" id="userId" name="userId" required>
						<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="비밀번호" id="userPwd" name="userPwd" required>
						<button type="submit" class="btn btn-success" id="login-btn">로그인</button>
						<input type="checkbox"/> 아이디 저장
					</div>
				</div>
			</form>
			<div id="login-sns" class="login">
				<h1>소셜 로그인</h1>
				<div id="sns-center">
					<a id="naver-login" class="sns-button">
						<img src="resources/images/user/naver_btnG_success.png">
					</a>
					<a id="kakao-login" class="sns-button">
						<img src="resources/images/user/kakao_login_large_narrow.png">
					</a>
				</div>
			</div>
		</div>
		<div id="regist-user">
			<div id="regist">
				<div id="search-id" onclick="location.href='#'">
					<h4>아이디 찾기</h4>
				</div>
				<div id="bar">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<div id="search-pwd" onclick="location.href='#'">
					<h4>비밀번호 찾기</h4>
				</div>
				<div id="bar">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<div id="enroll-user" onclick="location.href='enroll'">
					<h4>회원가입</h4>
				</div>
			</div>
		</div>
	
	</div>
</body>
</html>