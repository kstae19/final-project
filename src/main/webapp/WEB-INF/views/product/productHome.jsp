<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product Home</title>
<!-- jQuery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
@font-face {
	font-family: 'SBAggroB';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

div {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

.outer {
	height: 1100px;
}

#content {
	width: 1200px;
	height: 1000px;
	margin: auto;
}

#searching-area {
	height: 50px;
	width: 400px;
	margin: auto;
}

#searching-area>input[type=text] {
	width: 80%;
	height: 90%;
	border-left-width: 0;
	border-right-width: 0;
	border-top-width: 0;
	border-bottom-width: 1;
}

#searching-area>img {
	width: 18%;
	height: 90%;
	float: right;
}

#controll-area>select {
	margin-left: 790px;
	padding: 5px;
	font-size: 20px;
}

#controll-area>button {
	padding: 5px;
	margin-left: 5px;
	border-radius: 5px;
	border: none;
	background: #6EA0B1;
	color: white;
	font-size: 20px;
}

#product-area {
	font-family: 'SBAggroB';
	width: 100%;
	height: 90%;
}

#newist {
	width: 30%;
	height: 100%;
	float: left;
}

#newist>img {
	width: 100%;
	height: 35%;
}

#products {
	width: 70%;
	height: 100%;
	float: left;
}

.product {
	width: 49%;
	height: 49%;
	float: left;
	margin: 2px;
	cursor:pointer;
}

.product table {
	display: none;
	padding-top: 50px;
	padding-left: 100px;
	text-align:center;
}
.product table img{
	width : 50px;
	height:50px;
}

.product>h1 {
	color: rgb(205, 205, 154);
	font-size: 40px;
	text-align: center;
	line-height: 380px;
}

.like-cart {
	padding-left: 135px;
}

.like-cart>img {
	width: 30px;
	height: 30px;
	cursor:pointer;
}
</style>
</head>
<body>
	<div class="outer">
		<br> <br>
		<div id="content">
			<div id="searching-area">
				<input type="text" placeholder="검색어를 입력하세요."> <img
					src="resources/images/searhIcon.svg">
			</div>

			<div id="controll-area">
				<button>FOOD</button>
				<button>Eco Friendly Items</button>

				<select>
					<option>최신순</option>
					<option>좋아요순</option>
					<option>가격 높은순</option>
					<option>가격 낮은순</option>
				</select>
			</div>

			<div id="product-area">
				<div id="products">
					<c:forEach var="p" items="${productList }">
						<div id="${p.productNo }" class="product">
							<h1>${p.productName }</h1>
							<div>
							<table class="table">
								<thead>
									<tr>
										<th>옵션명</th>
										<th>가격</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="option" items="${p.optionList }">
										<tr>
											<td>${option.optionName }</td>
											<td>${option.price }</td>
										</tr>
									</c:forEach>
									<tr>	
									<td colspan="2"><img onclick="like(${p.productNo});" src="resources/images/heart-regular.svg"></td>
									</tr>
								</tbody>
							</table>
							</div>
							
						</div>
						<script>
							$(function() {
								$('#${p.productNo}').css({
									"background-image" : "url(${p.mainImg})",
									"background-size" : "cover",
									"opacity" : "0.9"
								}).hover(()=>{
									$('#${p.productNo}>h1').css("display", "none");
									$('#${p.productNo} table').css('display', 'block');
								}, ()=>{
									$('#${p.productNo} table').css("display", "none");
									$('#${p.productNo}>h1').css('display', 'block');
								}).click(()=>{
									location.href='product.detail?productNo='+${p.productNo};
								});
							})
						</script>
					</c:forEach>
				</div>
				
				<script>
					function like(pno){
						console.log(pno);
						$.ajax({
							url : 'product.like',
							data : {
								productNo : pno
							},
							success : e => {
								console.log(e);
							},
							error : e => {
								console.log('세상은 요지경~~');
							}
						})
					}
				</script>
				<c:if test = "${!empty loginUser}">
					<script>
						
					</script>
				</c:if>
				
				
				<div id="newist">
					<img src="resources/images/saltedbutter.jpg"> <img
						src="resources/images/butterpantry.png"> <br> <br>
					<div class="like-cart">
						<img src="resources/images/heart-solid.svg"> <img
							src="resources/images/shopping-cart-solid.svg">
					</div>
					<br>
					<table class="table table-hover">
						<thead>
							<tr>
								<th></th>
								<th>옵션명</th>
								<th>가격</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>바보춘식</td>
								<td>150000</td>
							</tr>
							<tr>
								<td>2</td>
								<td>똑똑춘식</td>
								<td>250000</td>
							</tr>
							<tr>
								<td>3</td>
								<td>보통춘식</td>
								<td>50000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>