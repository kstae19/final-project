<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
<style>
div {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	border: 1px solid orangered;
}

#product-content {
	width: 1000px;
	height: 1300px;
	margin: auto;
}

#product-content>div {
	width: 100%;
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
	height: 600px;
	align-items: center;
	justify-content: center;
}

#productTitle {
	display: flex;
	height: 100px;
}

#productName {
	width: 80%;
	height: 100%;
	text-align: center;
}

#productDescription {
	width: 100%;
	height: 400px;
}

#like-star {
	width: 20%;
	height: 100%;
}

#like {
	width: 100%;
	height: 70%;
}

#star {
	width: 100%;
	height: 30%;
}
</style>
</head>
<body>
	<div id="product-content">
		<div>
			<div id="main-pic">
				<img src="${p.mainImg }">
			</div>
			<div id="product-info">

				<div id="productTitle">
					<div id="productName">
						<h2>${p.productName }</h2>
						<h4>(${p.optionList[0].optionName })${p.optionList[0].price }원</h4>
					</div>
					<div id="like-star">
						<div id="like"></div>
						<div id="star"></div>
					</div>
				</div>

				<div id="productDescription">
					<div id="brandstory"></div>
					<div id="briefInfo">${p.productInfo }</div>
				</div>
				<div id="choice">
					<form action="product.orderForm">
						<select name="optionNo">
							<c:forEach items="${p.optionList }" var = "o">
								<option value="${o.optionNo }">${o.optionName}</option>
							</c:forEach>
						</select>
						<div id="order-qty">
							<input type="number" value="1" min="1" max="10">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>