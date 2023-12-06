<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

<style>

	div{
		/*border: 1px solid black;*/
	}
	
	#footer-main{
		margin: auto;
		width: 1200px;
		height: 150px;
		margin-bottom: 20px;
	}
	
	#footer-main > div{
		float: left;
	}
	
	#footer-logo{
		width: 20%;
		height: 100%;
	}
	
	#footer-logo > img{
		width: 100%;
		height: 100%;
	}
	
	#footer-info{
		width: 60%;
		height: 100%;
	}
	
	#footer-sns{
		width: 20%;
		height: 100%;
	}
	
	.main-footer{
		margin: 5px 0px;
		color : #28a745;
		font-size: 15px;
		font-weight: bold;
	}
	
	.sub-footer{
		margin: 5px 0px;
		color:#76b884;
		font-size: 13px;
		font-weight:600;
	}
	
	.copy-footer{
		margin: 5px 0px;
		color:#76b884;
		font-size: 12px;
		font-weight: 600;
	}
	
	#footer-btn{
		width: 200px;
		height: 40px;
		margin: auto;
		margin-top:55px;
	}
	
	.footer-btn{
		width: 50px;
		height:50px;
		color: #28a745;
		border : 2px solid #28a745;
		border-radius: 50px;
		opacity: 0.8;
	}
	
	#earth-btn, #git-btn, #ins-btn{
		margin: auto;
		margin-left:10px;
		font-size: 25px;
	}
</style>
<body>
	<div id="footer-main">
		<div id="footer-logo">
			<img src="resources/images/common/logo.png">
		</div>
		<div id="footer-info">
			<p class="main-footer">Eco Friendly&nbsp; | &nbsp;사업자등록번호: 111-11-111111&nbsp; | &nbsp;팀장 : 강성태&nbsp; | &nbsp;팀원 : 강현지, 강혜수, 박은희, 황성민 </p>
			<p class="sub-footer">강성태 : 폐끼치지 않고 열심히!<br>
								    강현지 : 부족하지만 열심히 하겠습니다. 감사합니다.<br>
								    강혜수 : 치열하게 고민하고 완성해내자<br>
								    박은희 : 끝까지 간다<br>
								    황성민 : 죽어라 하자!</p>
			<p class="copy-footer">Copyright © 2023-2023 Eco Friendly Institute All Right Reserved</p>
		</div>
		<div id="footer-sns">
			<div id="footer-btn">
				<button class="footer-btn" id="earth-btn"><i class='fas fa-globe-asia'></i></button>
				<button class="footer-btn" id="git-btn"><i class="fa fa-github-alt"></i></button>
				<button class="footer-btn" id="ins-btn"><i class="fa fa-instagram"></i></button>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			$('#earth-btn').on('click', () => {
				location.href = "https://namu.wiki/w/%EC%A7%80%EA%B5%AC";
			});
			
			$('#git-btn').on('click', () => {
				location.href = "https://github.com/kstae19/final-project";
			});
			
			$('#ins-btn').on('click', () => {
				location.href = "https://www.instagram.com/kh_iei/";
			});
			
		});
	</script>
</body>
</html>