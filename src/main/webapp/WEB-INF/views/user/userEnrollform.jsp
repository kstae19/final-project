<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<title>회원가입</title>
<style>
	div{
		border : 2px solid darkgreen;
		box-sizing: border-box;
	
	}
	
	#enroll-main {
		width : 1200px;
		height : 800px;
		margin: auto;
		background-color: #f7f2e9;
		
	}
	.enroll > h1{
		font-weight: bold;
		margin-top : 150px;
		margin-bottom : 20px;
		text-align: center;
	}
</style>
</head>
<body>
	<div id="enroll-main">
		<div id="enroll-id" class="enroll">
			<h1>회원가입</h1>
			<div class="enroll-center">
				<div class="enroll-border">
					<input type="text" class="form-control mb-2 mr-sm-2" placeholder="아이디" id="userId" name="userId">
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="비밀번호" id="userPwd" name="userPwd">
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="비밀번호 확인" id="userPwd" name="userPwd">
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="이름" id="userPwd" name="userPwd">
				</div>
				<div>
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="이메일" id="userPwd" name="userPwd">
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="인증번호" id="userPwd" name="userPwd">
					<input type="button" onclick="" value="전송">
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="휴대전화(-포함)" id="userPwd" name="userPwd">
				</div>
				<div>
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="우편번호" id="userPwd" name="userPwd">
					<input type="button" onclick="sample4_execDaumPostcode()" value="검색">
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="주소" id="userPwd" name="userPwd">
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="상세주소" id="userPwd" name="userPwd">
				</div>
			</div>
		</div>
	</div>
</body>
</html>