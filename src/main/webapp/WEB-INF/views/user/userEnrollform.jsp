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
		/*border : 2px solid darkgreen;*/
		box-sizing: border-box;
	}
	
	#enroll-main {
		width : 1200px;
		height : 1300px;
		margin: auto;
		background-color: #f7f2e9;
		
	}
	.enroll > h1{
		font-weight: bold;
		padding-top : 150px;
		margin-bottom : 20px;
		text-align: center;
	}
	.enroll-border{
	 	width : 400px;
	 	padding : 25px;
	 	margin: auto;
	 	margin-bottom : 20px;
	 	margin-top: 20px;
	 	border : 1px solid lightgray;
	 	border-radius : 33px;
	}
	
	.form-control {
		width : 350px;
		height : 50px;
	}
	.st {
		width : 280px;
		height : 50px;
	}
	
	.rd {
		border-color : red;
	}
	
	.floatleft > input {
		display: inline-block;
	}
	
	.btn {
		height : 45px;
		margin-bottom: 5px;
	}
	
	#enroll-info {
		color: red;
		float: right;
	}
	#info {
		width : 400px;
	 	margin: auto;
	 	margin-bottom : 30px;
	 	border : 1px solid transparent;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div id="enroll-main">
		<div id="enroll-id" class="enroll">
			<h1>회원가입</h1>
			<form action="insert" method="get" id="enroll-form">
				<div id="info">
					<b id="enroll-info">*필수 입력사항</b>
				</div>
				<div class="enroll-border rd">
					<input type="text" class="form-control mb-2 mr-sm-2" placeholder="아이디" id="userId" name="userId">
					<div id="idcheckResult" style="font-size:0.8em; display:none;">
					
					</div>
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="비밀번호" id="userPwd" name="userPwd">
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="비밀번호 확인" id="checkPwd" >
					<div id="pwdcheckResult" style="font-size:0.8em; display:none;">
					
					</div>
					<input type="text" class="form-control mb-2 mr-sm-2"  placeholder="이름" id="userName" name="userName">
					<div id="namecheckResult" style="font-size:0.8em; display:none;">
					
					</div>
				</div>
				<div class="enroll-border">
					<input type="text" class="form-control mb-2 mr-sm-2"  placeholder="이메일" id="email" name="email">
					<div class="floatleft">
						<input type="number" class="form-control mb-2 mr-sm-2 st"  placeholder="인증번호" id="" name="">
						<input type="button" class="btn btn-secondary" onclick="" value="전송">
					</div>
					<input type="text" class="form-control mb-2 mr-sm-2"  placeholder="휴대전화(-포함)" id="phone" name="phone">
				</div>
				<div class="enroll-border">
					<div class="floatleft">
						<input type="text" class="form-control mb-2 mr-sm-2 st"  placeholder="우편번호" id="post" name="post">
						<input type="button" class="btn btn-secondary" onclick="sample4_execDaumPostcode()" value="검색">
					</div>
					<input type="text" class="form-control mb-2 mr-sm-2"  placeholder="주소" id="address" name="address">
					<input type="text" class="form-control mb-2 mr-sm-2"  placeholder="상세주소" id="detailAddress" name="detailAddress">
				</div>
				<div class="btns" align="center">
                   	<button type="submit" class="btn btn-primary">회원가입</button>
               		<button type="reset" class="btn btn-danger">초기화</button>
               	</div>
			</form>
		</div>
	</div>
</body>
</html>