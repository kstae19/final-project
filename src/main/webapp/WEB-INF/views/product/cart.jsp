<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<style>
/*--공통 스타일 --*/
div {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	border : 1px solid orange;
}

.outer {
	height: 1100px;
}

.content {
	width: 1200px;
	height: 1000px;
	margin: auto;
}
#criteria, .item, .item-info{
	display: flex;
}
.qty, .price{
	width:20%;
	height:200px;
	text-align: center;
	margin:auto;
	align-items: center;
	padding-top:65px;
}
.item{
	align-items: center;	
}
.item>.item-info{
	height:200px;
}
.item-info{
	width:60%;
	align-items: center;	
}
.item-info>img{
	width : 200px;
	height : 100%;
}
.item-info>div{
	padding-left:10px;
	height:100%;
}
.item button{
	background:rgb(241, 208, 158);
	border-color: beige;
	padding:5px 10px 5px 10px;
	margin:5px;
}
.product-name{
	font-size: 20px;
	font-weight: 500;
}
h3{
	padding: 0%;
	margin:0;
}

</style>

</head>
<body>
<jsp:include page="../common/header.jsp"/>
<br>
<br>
<br>
<br>
<div class="outer">
	<div class="content">
		<div id = "criteria">
			<span><input type="checkbox"></span>
			<div style="width:60%;">상품정보</div>
			<div style="width:20%;">수량</div>
			<div style="width:20%;">주문 금액</div>
		</div>
		<div class="item">
			<span><input type="checkbox"></span>
			<div class="item-info">
				<img src="resources/images/product/chocolaCokie1.jpg">
				<div>
					<a href="#">헬렌스 쿠키</a><br>
					<a href="product.detail?productNo=2" class="product-name"><h3>비건 수제 쿠키 70g</h3></a><br>
					<div>상품 설명이 어쩌고저쩌고 룰루루루 상품 설명이 어쩌고저쩌고 
						룰루루루 상품 설명이 어쩌고저쩌고 룰루루루 상품 설명이 어쩌고저쩌고 룰루루루 상품 설명이 어쩌고저쩌고 룰루루루</div>
					<span>레몬 쿠키</span>
					<span> 12000원 </span>
				</div>
			</div>
			<div class="qty"><button>-</button>1<button>+</button>
				<br>
				<a href="#">삭제하기</a></div>
			<div class="price">가격 <br><button>결제하기</button></div>
		</div>
		<c:forEach items="cart" var="it">
			<div class="item">
			<span><input type="checkbox"></span>
			<div class="item-info">
				<img src="resources/images/product/chocolaCokie1.jpg">
				<div>
					<a href="#">헬렌스 쿠키</a><br>
					<a href="product.detail?productNo=2" class="product-name"><h3>비건 수제 쿠키 70g</h3></a><br>
					<div>상품 설명이 어쩌고저쩌고 룰루루루 상품 설명이 어쩌고저쩌고 
						룰루루루 상품 설명이 어쩌고저쩌고 룰루루루 상품 설명이 어쩌고저쩌고 룰루루루 상품 설명이 어쩌고저쩌고 룰루루루</div>
					<span>레몬 쿠키</span>
					<span> 12000원 </span>
				</div>
			</div>
			<div class="qty"><button>-</button>${}<button>+</button>
				<br>
				<a href="#">삭제하기</a></div>
			<div class="price">가격 <br><button>결제하기</button></div>
		</div>
		</c:forEach>
	</div>
</div>



</body>
</html>