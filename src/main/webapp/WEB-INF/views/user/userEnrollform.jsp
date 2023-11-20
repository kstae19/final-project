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
	 	border : 1px solid #28a745;
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
			<form action="insert" method="post" id="enroll-form">
				<div id="info">
					<b id="enroll-info">*필수 입력사항</b>
				</div>
				<div class="enroll-border rd">
					<input type="text" class="form-control mb-2 mr-sm-2" placeholder="아이디" id="userId" name="userId" required>
					<div id="idcheckResult" style="font-size:0.8em; display:none;" class="Result">
					
					</div>
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="비밀번호" id="userPwd" name="userPwd" required>
					<input type="password" class="form-control mb-2 mr-sm-2"  placeholder="비밀번호 확인" id="checkPwd" required>
					<div id="pwdcheckResult" style="font-size:0.8em; display:none;" class="Result">
					
					</div>
					<input type="text" class="form-control mb-2 mr-sm-2"  placeholder="이름(닉네임)" id="userName" name="userName" required>
					<div id="namecheckResult" style="font-size:0.8em; display:none;" class="Result">
					
					</div>
					
					<br>
					<input type="text" class="form-control mb-2 mr-sm-2"  placeholder="이메일" id="email" name="email">
					<div class="floatleft">
						<input type="text" class="form-control mb-2 mr-sm-2 st"  placeholder="인증번호" id="secret" name="secret" disabled>
						<input type="button" class="btn btn-secondary" id="secretbtn" onclick="send();" value="전송">
						<div id="emailcheckResult" style="font-size:0.8em; display:none;" class="Result">
					
						</div>
					</div>
				</div>
				<div class="enroll-border">
					<div class="floatleft">
						<input type="text" class="form-control mb-2 mr-sm-2 st"  placeholder="우편번호" id="postNo" name="postNo">
						<input type="button" class="btn btn-secondary" onclick="DaumPostcode()" value="검색">
					</div>
					<input type="text" class="form-control mb-2 mr-sm-2"  placeholder="주소" id="address" name="address">
					<input type="text" class="form-control mb-2 mr-sm-2"  placeholder="상세주소" id="detailAddress" name="detailAddress"><br>
					<input type="text" class="form-control mb-2 mr-sm-2"  placeholder="휴대전화(-포함)" id="phone" name="phone">
				</div>
				<div class="btns" align="center">
                   	<button type="submit" class="btn btn-primary" disabled>회원가입</button>
               		<button type="reset" class="btn btn-danger">초기화</button>
               	</div>
			</form>
		</div>
	</div>
	
	<!-- 다음 우편번호 Api  -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>

	    
    	$(function(){
    		
			const $idInput = $('.enroll-border #userId');
			const $pwdInput = $('.enroll-border #userPwd');
			const $nameInput = $('.enroll-border #userName');
			const $checkPwdInput = $('.enroll-border #checkPwd');			
			const $emailInput = $('.enroll-border #email');
			const $secretInput = $('.enroll-border #secret');
			const $phoneInput = $('.enroll-border #phone');
			
			const $postInput = $('.enroll-border #postNo');
    		const $detailAddressInput = $('.enroll-border #detailAddress');
			
			const $checkIdResult = $('#idcheckResult');
			const $checkPwdResult = $('#pwdcheckResult');
			const $checkNameResult = $('#namecheckResult');
			const $checkEmailResult = $('#emailcheckResult');
			
			const $enrollFormSubmit = $('#enroll-form :submit');
			
			var checksecret = 0;
			
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
								$enrollFormSubmit.attr('disabled', true);
								checksecret = 0;
							}
							else { // 사용가능
								$checkEmailResult.show().css('color', 'green').text('인증번호 일치!!')
								$enrollFormSubmit.removeAttr('disabled');
								checksecret = 1;
							}
						},
						error : () => {
							console.log('이메일 인증번호용 AJAX통신 실패~!')
						}
					});
					console.log(checksecret);
				}
				else {
					$checkEmailResult.hide();
				}
			});
			
			
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
			
			
			$('body').on("click", () => {
				
				if($idInput.val().length > 0 && $pwdInput.val() == $checkPwdInput.val() && $pwdInput.val().length >= 5 && $checkPwdInput.val().length >= 5 && $nameInput.val().length > 0 && $emailInput.val().length > 0){
					
					// 입력값이 있는 경우
					if ($emailInput.val().length > 0 && $secretInput.val().length === 0) {
					    $enrollFormSubmit.attr('disabled', true);
					} 
					else if ($postInput.val().length > 0 && $detailAddressInput.val().length === 0) {
					    $enrollFormSubmit.attr('disabled', true);
					} 
					else {
					    $enrollFormSubmit.removeAttr('disabled');
					}
				}
				else {
					$enrollFormSubmit.attr('disabled', true);
				}
			});
    	});
    	
    	// 이메일 인증 기능
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
				 		$('.enroll-border #secret').removeAttr('disabled');
					}
				},
				error : () => {
					alert('이메일 주소를 입력해주세요!');
					console.log('이메일 인증용 AJAX통신 실패~!')
				}
	   		 });
	   	 }
    	
    	// 다음 우편번호 Api
	    function DaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $('.enroll-border #postNo').val(data.zonecode);
	                $('.enroll-border #address').val(addr);
	                // 커서를 상세주소 필드로 이동한다.
	                
	            }
	        }).open();
		}
    	
		

    	
    </script>
</body>
</html>