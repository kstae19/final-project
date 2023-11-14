<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="비밀번호" id="userPwd" name="userPwd">
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="비밀번호" id="userPwd" name="userPwd">
				</div>
				<div>
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="비밀번호" id="userPwd" name="userPwd">
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="비밀번호" id="userPwd" name="userPwd">
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="비밀번호" id="userPwd" name="userPwd">
				</div>
			</div>
		</div>
	</div>
</body>
</html>