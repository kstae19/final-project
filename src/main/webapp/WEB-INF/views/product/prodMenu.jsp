<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑 메뉴바</title>
<style>
#shopping-menu{
	width:100%;
	height : 40px;
	display:flex;
}
#shopping-menu>div{
	width:150px;
	height : 100%;
	font-size:20px;
	padding:2px;
	margin:1px 10px 1px 10px;
}
a{
	text-decoration:none;
}
#shopping-menu a:hover{
	font-size:21px;
}
</style>
</head>
<body>
	<div id="shopping-menu">
		<div>
			<a href="shoppingList?userNo=${sessionScope.loginUser.userNo }">주문내역 확인</a>
		</div>
		<div>
			<a href="myshopping?userNo=${sessionScope.loginUser.userNo }">내 쇼핑</a>
		</div>
	</div>
</body>
</html>