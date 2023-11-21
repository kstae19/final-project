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
	#findId-main {
		width : 1200px;
		height : 800px;
		margin: auto;
		background-color: #f7f2e9;
		
	}

	.findId > h1 {
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
	 	border : 1px solid #28a745;
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
	
	<div id="findId-main">
		<form action="findId.us" method="post" id="findId-form">
			<div id="findId-input" class="findId">
				<h1>아이디 찾기</h1>
				<div class="enroll-border">
					<input type="text" class="form-control mb-2 mr-sm-2"  placeholder="이름(닉네임)" id="userName" name="userName" required>
					<input type="text" class="form-control mb-2 mr-sm-2"  placeholder="이메일" id="email" name="email" required disabled>
					<div id="namecheckResult" style="font-size:0.8em; display:none;" class="Result">
					
					</div><br>
				 	<div class="btns" align="center">
	                   	<button type="submit" class="btn btn-success" disabled>아이디 찾기</button>
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
					$('.enroll-border #email').removeAttr('disabled');
				}
				
			});
			
			$('.enroll-border #email').keyup( () => {
				$.ajax({
					url : 'nameCheck',
					data : {
						checkName : $('#userName').val(),
						checkEmail : $('#email').val()
					},
					success : result => {
						if(result.substr(4) === 'N'){ // 사용불가능
							$('#namecheckResult').show().css('color', 'crimson').text('이름(별명)과 이메일이 일치하지 않습니다')
							$('#findId-form :submit').attr('disabled', true);
						}
						else { // 사용가능
							$('#namecheckResult').show().css('color', 'green').text('이름(별명)과 이메일이 일치합니다!')
							$('#findId-form :submit').removeAttr('disabled');
						}
					},
					error : () => {
						console.log('아이디 찾기 이름검색 실패!')
					}
				});
			});

		});
	</script>

</body>
</html>