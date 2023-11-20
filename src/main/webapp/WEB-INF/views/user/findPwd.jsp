<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<style>
	#findPwd-main {
		width : 1200px;
		height : 800px;
		margin: auto;
		background-color: #f7f2e9;
		
	}

	.findPwd > h1 {
		font-weight: bold;
		padding-top : 150px;
		margin-bottom : 50px;
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
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div id="findPwd-main">
		<form action="findPwd.us" method="post" id="findPwd-form">
			<div id="findPwd-input" class="findPwd">
				<h1>비밀번호 찾기</h1>
				<div class="enroll-border">
					<input type="text" class="form-control mb-2 mr-sm-2"  placeholder="이름(닉네임)" id="userName" name="userName" required>
					<input type="text" class="form-control mb-2 mr-sm-2" placeholder="아이디" id="userId" name="userId" required disabled>
					<input type="text" class="form-control mb-2 mr-sm-2"  placeholder="이메일" id="email" name="email" required disabled>
					<div id="namecheckResult" style="font-size:0.8em; display:none;" class="Result">
					
					</div><br>
				 	<div class="btns" align="center">
	                   	<button type="submit" class="btn btn-success" disabled>비밀번호 찾기</button>
	               		<button type="reset" class="btn btn-danger">초기화</button>
	               	</div>
				</div>
			</div>
		</form>
	</div>
	
	<script>
		$(function(){
			
			$('.enroll-border #userName').keyup(() => {
				if($('.enroll-border #userName').val().length > 0){
					$('.enroll-border #userId').removeAttr('disabled');
				}
			});
			
			$('.enroll-border #userId').keyup(() => {
				if($('.enroll-border #userId').val().length > 0){
					$('.enroll-border #email').removeAttr('disabled');
				}
			})
			
			$('.enroll-border .form-control').keyup( () => {
				$.ajax({
					url : 'nameIdCheck',
					data : {
						checkName : $('#userName').val(),
						checkId : $('#userId').val(),
						checkEmail : $('#email').val()
					},
					success : result => {
						if(result.substr(4) === 'N'){ // 사용불가능
							$('#namecheckResult').show().css('color', 'crimson').text('회원 정보가 일치하지 않습니다')
							$('#findPwd-form :submit').attr('disabled', true);
						}
						else { // 사용가능
							$('#namecheckResult').show().css('color', 'green').text('회원 정보가 일치 합니다!')
							$('#findPwd-form :submit').removeAttr('disabled');
						}
					},
					error : () => {
						console.log('비밀번호 찾기 이름검색 실패!')
					}
				});
			});
		});
	</script>

</body>
</html>
