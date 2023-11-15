<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
<!-- jQuery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
div {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	border : 1px solid orange;
}

#product-content {
	width: 1000px;
	margin: auto;
}

#product-top {
	width: 100%;
	height:600px;
	display: flex;
	align-items: center;
	justify-content: center;
}

#main-pic {
	width: 450px;
	height: 500px;
}

#main-pic>img {
	width: 100%;
	height: 100%;
	padding: 1px;
}
/*--간단한 제품 정보(상단)--*/
#product-info {
	width: 550px;
	height: 500px;
	align-items: center;
	justify-content: center;
}

#productTitle {
	display: flex;
	height: 100px;
	margin-left:10px;
	background:rgb(234, 226, 213);
	opacity:0.9;
}

#productName {
	width: 80%;
	height: 100%;
	text-align: center;
}

#productDescription {
	width: 100%;
	height: 400px;
	padding:10px;
}
#productDescription>div{
	width:100%;
	margin-bottom:10px;
}
#brandStory{
	height:300px;
}
#briefInfo{
	height:100px;
}

#like-star {
	width: 20%;
	height: 100%;
}

#like {
	width: 100%;
	height: 55%;
	padding-left:25px;
}
#like>img{
	width: 50px;
	height:50px;
}
#star {
	width: 100%;
	height: 45%;
	text-align:center;
}
#choice input, select {
	width: 80%;
	height: 30px;
	border: none;
	margin-left:50px;
}
#picture-area {
	width: 100%;
}

#picture-area>img {
	width: 800px;
	height: 600px;
	margin-left : 100px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div id="product-content">
		<div id="product-top">
			<div id="main-pic">
				<img src="${p.mainImg }">
			</div>
			<div id="product-info">
				<div id="productTitle">
					<div id="productName">
						<h1>${p.productName }</h1>
					</div>
					<div id="like-star">
						<div id="like"><img onclick="like(${p.productNo})" src="resources/images/heart-regular.svg"></div>
						<div id="star"><a href="product.review?productNo=${p.productNo }">${review.starRate }/5</a><br>(${review.reviewNo }개) </div>
					</div>
				</div>

				<div id="productDescription">
					<div id="brandstory">
					<h3 id="brand${brand.brandNo }">${brand.brandName }</h3>
					<p>${brand.brandIntro }</p>
					</div>
					
					<div id="briefInfo">${p.productInfo }</div>
					
					<div id="choice">
						<form action="product.orderForm">
							<select name="optionNo" required>
								<option value="0">옵션을 선택하세요</option>
								<c:forEach items="${p.optionList }" var="option">
									<option value="${option.optionNo }">${option.optionName}</option>
								</c:forEach>
							</select> 
							
							<span id="price"></span>
							
							<br> 
							
							<input type="number" value="1" min="1" max="10" required>
							<span id="totalPrice"></span>
							
							<br>
							
							<button type="button">장바구니 추가</button>
							<button type="submit">구매하기</button>
						</form>
					</div><!-- 옵션 선택 영역 끝 -->
				</div><!-- 제품 설명영역 끝 -->
			</div>
		</div>
				<script>
					function like(pno){
						console.log(pno);
						$.ajax({
							url : 'product.like',
							data : {
								productNo : pno,
								userNo : ${loginUser.userNo}
							},
							success : e => {
								console.log(e);
							},
							error : e => {
								console.log('세상은 요지경~~');
							}
						})
					}
					$(()=>{
						$('#choice select').change(()=>{
							$.ajax({
								url : 'getPrice',
								data : {optionNo : $('#choice select').val()},
								success : price =>{
									//$qty = $('#choice input').val();
									//$price = $qty*Number(price.replace(',', ''));
									//console.log($price);
									//console.log($qty);
									$('#price').text(price+'원');
								},
								error : ()=>{
									console.log('공부 더해 이자기식아!');
								}
							})
						});
						$('#choice input').change(()=>{
							let price = $('#choice span').text();
							let totalPrice =parseInt(price.replace(',', ''))*parseInt($('#choice input').val());
							$('#totalPrice').text(totalPrice.toLocaleString()+'원');
							
						})
					})
				</script>
		<div id="picture-area">
			<c:forEach items="${images }" var="img">
				<img src="${img}">
				<br>
			</c:forEach>
		</div>
	</div>
</body>
</html>