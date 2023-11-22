<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
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
	border: 1px solid transparent;
}

.outer {
	height: 1500px;
	background: rgb(245, 238, 220);
}

#order-content {
	width: 800px;
	margin: auto;

}

#order-content>div {
	width: 100%;
	padding: 5px 20px 5px 20px;
}

.order-item {
	padding-left: 100px;
	padding-right: 150px;
	display: flex;
	width:100%;
	margin: 5px 0px 5px 0px;
}

.order-item>img {
	width: 210px;
	height: 180px;
	border-radius: 2px;
}

.order-item>div {
	width: 300px;
	height: 180px;
	padding-left:20px;
	font-size : 20px;
}

h2 {
	margin: 0;
	padding: 0;
	background:rgb(216, 207, 186);
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<br>

	<div class="outer">
		<br> <br> <br>
		<div id="order-content">
			<form action="product.order" method="post">
				<div class="item-info">
					<h2>주문 상품 정보</h2>
						<c:if test="${not empty item }">
							<div class="order-item">
							<input type="hidden" name="items[0].optionNo" value="${item.optionNo }">
							<input type="hidden" name="items[0].qty" value="${order.qty }">
							<img src="${item.mainImg }">
							<div>
								<h5>${item.productName}</h5>
								<span>${item.optionName }</span>
								<span>${item.price *order.qty}</span>
							</div>
							</div>
						</c:if>
						<c:if test="${not empty items }">
							<c:forEach  items="${items.itemList}" var="i" varStatus="status">
								<div class="order-item">
									<input type="hidden" name="items[${status.index }].optionNo" value="${i.optionNo }">
									<input type="hidden" name="items[${status.index }].qty" value="${i.qty }">
									<img src="${i.mainImg }">
									<div>
										<h5>${i.productName} (${i.qty }개)</h5>
										<span>${i.optionName }</span>
										<span>${i.price *i.qty}원</span>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				<div class="orderer-info">
					<h2>주문자 정보</h2>
					<input type="hidden" name="userNo"
						value="${sessionScope.loginUser.userNo }"> <br> 이름 :
					<input type="text" readonly
						value="${sessionScope.loginUser.userName }"> <br> 연락처
					: <input type="text" readonly
						value="${sessionScope.loginUser.phone }"> <br> 이메일 :
					<input type="text" readonly
						value="${sessionScope.loginUser.email }"> <br><br><br>
				</div>
				<div class="shipping-info">
					<h2>배송 정보</h2>
					<input type="hidden" value="1" name="addressNo"> <br>
					<input type="text" readonly value="수령인"> <br> <input
						type="text" readonly value="연락처"> <br> <input
						type="text" readonly value="우편번호"> <br> <input
						type="text" readonly value="주소"> <br> <input
						type="text" readonly value="상세주소"> <br><br><br>
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