<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="icon" href="resources/images/1968582-28a745.png" type="image/x-icon">

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>
div{
	/*border: 1px solid black;*/
}
	body {
		font-family: 'Noto Sans KR', sans-serif;
	}
	#menubar{
		box-sizing : border-box;
	}
	.sidenav {
	  height: 100%;
	  width: 0;
	  position: fixed;
	  z-index: 1;
	  top: 0;
	  left: 0;
	  background-color: #b5ffc6;
	  overflow-x: hidden;
	  transition: 0.5s;
	  padding-top: 60px;
	}
	
	.sidenav a {
	  padding: 8px 8px 8px 32px;
	  text-decoration: none;
	  font-size: 25px;
	  color: #818181;
	  display: block;
	  transition: 0.3s;
	}
	
	.sidenav a:hover {
	  color: #28a745;
	}
	
	.sidenav .closebtn {
	  position: absolute;
	  top: 0;
	  right: 25px;
	  font-size: 36px;
	  margin-left: 50px;
	}
	
	@media screen and (max-height: 450px) {
	  .sidenav {padding-top: 15px;}
	  .sidenav a {font-size: 18px;}
	}
	
	.menu {
		float:left;
		width : 200px;
		cursor:pointer;
		margin:auto;
	}
	
	h1 {
	    display: block;
	    font-size: 20px;
	    margin-block-start: 0.67em;
	    margin-block-end: 0.67em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    font-weight: bold;
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
	
	h3 {
	    display: block;
	    font-size: 18px;
	    margin-block-start: 0.67em;
	    margin-block-end: 0.67em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    font-weight: bold;
	}

	.cart img{
		width:30px;
		height:30px;
	}
	
	#nav-main{
		margin: 0px 10px 0px 10px;
		width: 1200px;
		font-size:33px;
		margin: auto;
	}
	
	#nav-span{
		cursor:pointer;
		margin-left: 10px;
	}
	
	#nav-main > div{
		float:left;
	}
	
	#main{
		margin-left: 250px;
		text-decoration:none;
		color: #28a745;
		font-weight : bold;
	}
	
	.lim{
		margin-left:400px;
		cursor:pointer;
	}
	
	.lom{
		cursor:pointer;
	}
	
	.cart{
		width: 30px;
		margin-left: 10px;
	}
	
	.lom > h3{
		width: 80px;
		margin-left: 10px;
		text-align: center;
	}
	
	.iom > h3{
		width: 180px;
		text-align: center;
		margin: 5px;
		margin-top: 12px;
	}
	
	.iam {
		margin-left: 80px;
	}
	
	.lm {
		cursor:pointer;
	}
	
	#login-menu {
		margin-left: 30px;
	}
	
	#login-menu > div{
		float:left;
	}

</style>
</head>
<body>
	<div id="menubar" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a class="menu" href="bookMyPage">BOOK</a>
		<a class="menu" href="#">EVENT</a>
		<a class="menu" href="#">CHALLENGE</a>
		<a class="menu" href="#">PRODUCT</a>
		<a class="menu" href="#">MOVE</a>
		<a class="menu" href="/eco">MAIN</a>
	</div>


	<c:if test="${ not empty alertMsg }">
		<script>
			alert('${alertMsg}')
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	<c:if test="${ not empty loginAlert }">
		<script>
			alert('${loginAlert}')
		</script>
		<c:remove var="loginAlert" scope="session" />
	</c:if>
	<div id="nav-main">
		<div>
			<span id="nav-span" onclick="openNav()">
				&#9776;
			</span>
		</div>
		<div id="main"><a class="main" id="main" href="/eco">Eco Friendly</a></div>
		<c:choose>
			<c:when test="${ empty sessionScope.accessToken and empty sessionScope.accessNToken }">
				<div id="login-menu">
					<div class="iom">
						<h3>${ sessionScope.loginUser.userName }님 환영합니다</h3>
		            </div>
					<div class="cart" onclick="location.href='cart?userNo=${sessionScope.loginUser.userNo}'"><h3><img src="resources/images/shopping-cart-solid.svg"></h3></div>
					<div class="lom login-menu" onclick="location.href='mypage.us'"><h3>MYPAGE</h3> </div>
					<div class="lom login-menu" onclick="location.href='logout.us'"><h3>LOGOUT</h3> </div>
	            </div>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${ not empty sessionScope.accessNToken }">
						<div id="login-menu">
							<div class="iom">
								<h3>${ sessionScope.loginUser.userName }님 환영합니다</h3>
				            </div>
							<div class="cart" onclick="location.href='cart?userNo=${sessionScope.loginUser.userNo}'"><h3><img src="resources/images/shopping-cart-solid.svg"></h3></div>
							<div class="lom login-menu" onclick="location.href='mypage.us'"><h3>MYPAGE</h3> </div>
							<div class="lom login-menu" onclick="location.href='naverlogout.us'"><h3>네이버 LOGOUT</h3> </div>
			            </div>
					</c:when>
					<c:when test="${ not empty sessionScope.accessToken }">
						<div id="login-menu">
							<div class="iom">
								<h3>${ sessionScope.loginUser.userName }님 환영합니다</h3>
				            </div>
							<div class="lom cart" onclick="location.href='cart?userNo=${sessionScope.loginUser.userNo}'"><h3><img src="resources/images/shopping-cart-solid.svg"></h3></div>
							<div class="lom login-menu" onclick="location.href='mypage.us'"><h3>MYPAGE</h3> </div>
							<div class="lom login-menu" onclick="location.href='kakaologout.us'"><h3>카카오 LOGOUT</h3> </div>
			            </div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	</div>
	<script>
		function openNav() {
		  document.getElementById("menubar").style.width = "250px";
		}
		
		function closeNav() {
		  document.getElementById("menubar").style.width = "0";
		}
		
		$(()=>{
			$('.menu').hover(function(){
				$(this).css({'color':'#28a745', 'font-weight':'bold'});
			}, function(){
				$(this).css({'color':'#818181', 'font-weight':'400'});
			});
			$('.login-menu').hover(function(){
				$(this).css({'color':'#28a745', 'font-weight':'bold'});
			}, function(){
				$(this).css('color', 'black');
			});
			$('.main').hover(function(){
				$(this).css({'color':'#1b8533', 'font-weight':'bold'});
			}, function(){
				$(this).css('color', '#28a745');
			});
		})
	</script>
</body>
</html>