<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 주문</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
/*--공통 스타일 --*/
div {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	border : 1px solid orange;
}

.outer {
	height: 1500px;
	background :rgb(245, 238, 220);
}

#order-content {
	width: 800px;
	margin: auto;
}
#order-content>div{
	width:100%;
	padding:5px 20px 5px 20px;
	background:rgb(240, 231, 223);
}
.order-item{
	padding-left:150px;
	padding-right:150px;
	display:flex;
}
.order-item>img{
	width:200px;
	height:180px;
	border-radius:2px;
}
.order-item>div{
	width:300px;
	height:180px;
}
h2{
margin:0;
padding:0;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<br><br><br>
<div class="outer">
<br>
<br>
<br>
	<div id="order-content">
	<form action= "product.order" method="post">
		<div class="item-info">
		<h2>주문 상품 정보</h2>
		<div class="order-item">
			<input type="hidden" name="optionNo" value="${item.optionNo }">
			<input type="hidden" name="qty" value="${odrer.qty }">
			<img src="${item.mainImg }">
			<div>
				<h5>${item.productName} </h5>
				<h4>${item.optionName }</h4>
				<h4>${item.price *order.qty}</h4>
			</div>
		</div>
		</div>
		<div class="orderer-info">
		<h2>주문자 정보</h2>
		<input type="hidden" name = "userNo" value="${sessionScope.loginUser.userNo }">
		<br>
		이름 : <input type="text" readonly value="${sessionScope.loginUser.userName }">	<br>
		연락처 : <input type="text" readonly value="${sessionScope.loginUser.phone }">	<br>
		이메일 : <input type = "text" readonly value="${sessionScope.loginUser.email }">	<br>
		</div>
		<div class="shipping-info">
		<h2>배송 정보</h2>
			<h2>주문자 정보</h2>
		<input type="hidden" value="배송지 번호(미리 등록)" name="addressNo">	<br>
		<input type="text" readonly value="수령인">	<br>
		<input type="text" readonly value="연락처">	<br>
		<input type = "text" readonly value="우편번호">	<br>
		<input type = "text" readonly value="주소">	<br>
		<input type = "text" readonly value="상세주소">	<br>
		<input>
		</div>
		<div class="order-summary">
		<h3>주문 요약</h3>
			
				<button type="submit">결제하기</button>
		</div>
	</form>
	</div>
</div>
</body>
</html>