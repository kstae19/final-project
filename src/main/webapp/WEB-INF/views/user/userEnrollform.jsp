<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
	.Result {
		margin-left : 5px;
		margin-bottom : 5px;
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
					<div id="idcheckResult" style="font-size:0.8em; display:none;" class="Result">
					
					</div>
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="비밀번호" id="userPwd" name="userPwd">
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="비밀번호 확인" id="checkPwd" >
					<div id="pwdcheckResult" style="font-size:0.8em; display:none;" class="Result">
					
					</div>
					<input type="text" class="form-control mb-2 mr-sm-2"  placeholder="이름(닉네임)" id="userName" name="userName">
					<div id="namecheckResult" style="font-size:0.8em; display:none;" class="Result">
					
					</div>
				</div>
				<div class="enroll-border">
					<input type="text" class="form-control mb-2 mr-sm-2"  placeholder="이메일" id="email" name="email">
					<div class="floatleft">
						<input type="text" class="form-control mb-2 mr-sm-2 st"  placeholder="인증번호" id="secret" name="secret">
						<input type="button" class="btn btn-secondary" onclick="send();" value="전송">
						<div id="emailcheckResult" style="font-size:0.8em; display:none;" class="Result">
					
						</div>
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
                   	<button type="submit" class="btn btn-primary" disabled>회원가입</button>
               		<button type="reset" class="btn btn-danger">초기화</button>
               	</div>
			</form>
		</div>
	</div>
	
	 <script>
    	$(function(){
    		
			const $idInput = $('.enroll-border #userId');
			const $pwdInput = $('.enroll-border #userPwd');
			const $nameInput = $('.enroll-border #userName');
			const $emailInput = $('.enroll-border #email');
			const $secretInput = $('.enroll-border #secret');
			const $checkIdResult = $('#idcheckResult');
			const $checkPwdResult = $('#pwdcheckResult');
			const $checkNameResult = $('#namecheckResult');
			const $checkEmailResult = $('#emailcheckResult');
			const $checkPwdInput = $('.enroll-border #checkPwd');
			const $enrollFormSubmit = $('#enroll-form :submit');
			
			$secretInput.keyup(() => {
			
				if($secretInput.val().length >= 6){
					$.ajax({
						url : 'check',
						data : {
							checkSecret : $secretInput.val()
						},
						success : result => {
							if(result.substr(4) === 'N'){ // 사용불가능
								$checkEmailResult.show().css('color', 'crimson').text('인증번호 불일치..')
								//$enrollFormSubmit.attr('disabled', true);
							}
							else { // 사용가능
								$checkEmailResult.show().css('color', 'green').text('인증번호 일치!!')
								//$enrollFormSubmit.removeAttr('disabled');
							}
						}
						
					})
				}
				else {
					$checkEmailResult.hide();
				}
				
			})
			
			$idInput.keyup(() => {
				// console.log($idInput.val());
				
				// 최소 다섯 글자 이상으로 입력했을때만 AJAX요청을 보내서 중복체크
				if($idInput.val().length >= 5){
					
					$.ajax({
						url : 'idCheck.me',
						data : {
							checkId : $idInput.val()
						},
						success : result => {
							//console.log(result);
							if(result.substr(4) === 'N'){ // 사용불가능
								$checkIdResult.show().css('color', 'crimson').text('사용할 수 없는 아이디입니다. 다른 아이디를 입력해 주세요.')
								//$enrollFormSubmit.attr('disabled', true);
							}
							else { // 사용가능
								$checkIdResult.show().css('color', 'green').text('사용할 수 있는 아이디입니다!')
								//$enrollFormSubmit.removeAttr('disabled');
							}
						},
						error : () => {
							console.log('아이디 중복체크용 AJAX통신 실패~!')
						}
					});
				}
				else {
					$checkIdResult.hide();
					//$enrollFormSubmit.attr('disabled', true);
				}
			});
			
			$pwdInput.keyup(() => {
				if($pwdInput.val().length <= 5){
					$checkPwdResult.show().css('color', 'crimson').text('비밀번호를 5자리 이상 작성해주세요')
				}
				else{
					$checkPwdResult.hide();
				}
			});
			
			$checkPwdInput.keyup(() => {
				if($pwdInput.val() != $checkPwdInput.val()){
					$checkPwdResult.show().css('color', 'crimson').text('비밀번호가 동일하지 않습니다.')
				}
				else { // 사용가능
					$checkPwdResult.show().css('color', 'green').text('비밀번호 일치!')
				}
			});
			
			$nameInput.keyup(() => {
				if($nameInput.val().length == 0){
					$checkNameResult.show().css('color', 'crimson').text('이름(닉네임)을 입력해주세요.')
				}
				else { // 사용가능
					if($nameInput.val().length < 2){
						$checkNameResult.show().css('color', 'crimson').text('이름(닉네임)을 2자리 이상 작성 해주세요.')
					}
					else {
						$checkNameResult.show().css('color', 'green').text('이름(닉네임) 입력 확인!')
					}
				}
			});
    	});
	function send() {
		const $emailInput = $('.enroll-border #email');
   		 $.ajax({
   			 url : 'mail',
   			 data : {
				email : $emailInput.val()
			 },
			 success : result => {
				 if(result.substr(4) === 'N'){ // 사용불가능
					 	alert('이메일 주소를 다시 입력해주세요!');
				}
				else { // 사용가능
			 		alert($('#email').val() + '으로 인증번호가 발송되었습니다!');
				}
			},
			error : () => {
				console.log('이메일 인증용 AJAX통신 실패~!')
			}
   		 });
   	 }
    	
    </script>
</body>
</html>