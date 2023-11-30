<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
div {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	border: 1px solid orange;
}

.outer {
	margin-top: 70px;
	height: 1100px;
}

.content {
	width: 1200px;
	height: 1000px;
	margin: auto;
}

h2 {
	margin: 12px;
}

#like-list, #review-list, #order-list {
	width: 100%;
	height: 300px;
	margin-bottom: 20px;
	padding: 0px 50px 0px 50px;
}

.like-product {
	width: 200px;
	height: 210px;
	float:left;
}

.like-product>img {
	width: 180px;
	height: 160px;
	margin: 10px;
}

.like-product>div {
	width: 200px;
	height: 25px;
	text-align: center;
	font-size: 16px;
}

.like-product button {
	background: none;
	border: none;
	cursor: pointer;
	font-weight: 600;
	float: right;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="outer">
		<div class="content">
			<c:choose>
				<c:when test="${empty likeList }">
					<div id="like-list" style="display:none"></div>
				</c:when>
				<c:otherwise>
				<div id="like-list">
				<h2>찜한 상품</h2>
				<c:forEach items="${likeList }" var="like">
					<div class="like-product">
						<img src="${like.mainImg}" 
						onclick="location.href='product.detail?userNo=${sessionScope.loginUser.userNo}
						&productNo=${like.productNo}'">
						<div>${like.productName}
							<button onclick="removeLike(${like.productNo}, this);" >X</button>
						</div>
					</div>
				</c:forEach>
			</div>
				</c:otherwise>
			</c:choose>

			<div id="review-list">
				<h2>최근 후기</h2>
			</div>
			<div id="order-list">
				<h2>최근 주문</h2>
				<div>
					<a href="">더 보기</a>
				</div>
			</div>
		</div>
	</div>
	<script>
		function removeLike(pno, btn){
			$.ajax({
				url : 'delete.like',
				data :{productNo : pno, userNo : '${sessionScope.loginUser.userNo}'},
				success : e=>{
					$(btn).parents('.like-product').css('display', 'none');
				},
				error : () =>{
					console.log('에이젝스 시렁');
				}
			})
		}
	</script>
</body>
</html>