<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
div {
	box-sizing: border-box;
	margin: 0;
	padding: 0;

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
	cursor:pointer;
}

.like-product>div {
	width: 200px;
	height: 25px;
	text-align: center;
	font-size: 16px;
}

.like-product button {
	background: beige;
	border: none;
	cursor: pointer;
	font-weight: 600;
	float: right;
}
#review-list img{
	width:180px;
	height:160px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="outer">
		<div class="content">
		<jsp:include page="prodMenu.jsp"/>
		<c:if test = "${empty likeList and empty review and empty orderList }">
			<h3>등록된 찜/리뷰/주문 목록이 존재하지 않습니다.</h3>
		</c:if>
			<c:if test="${not empty likeList }">
				<div id="like-list">
				<h2>찜한 상품</h2>
					<c:forEach items="${likeList }" var="like">
						<div class="like-product">
							<img src="${like.mainImg}" 
							onclick="location.href='product.detail?userNo='+${sessionScope.loginUser.userNo}
							+'&productNo='+${like.productNo}">
							<div>${like.productName}
								<button onclick="removeLike(${like.productNo}, this);" > X </button>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
			<c:if test="${not empty review}">
				<div id="review-list">
					<h2>최근 후기</h2>
					<table class="table table-borderless">
						<tbody>
							<tr>
								<td rowspan="3"><img src="${review.changeName}"></td>
								<td>${review.reviewNo}. ${review.reviewTitle }</td>
								<td>${review.starRate}/5</td>
							</tr>
							<tr>
								<td>${review.option}</td>
								<td><button class="btn btn-outline-warning">수정</button></td>
							</tr>
							<tr>
								<td>${review.reviewContent }</td>
								<form action="delete.review" method="get">
								<input type="hidden" name="reviewNo" value="${review.reviewNo}"/>
								<td><button type="sumbit" class="btn btn-outline-danger">삭제</button></td>
								</form>
							</tr>
						</tbody>
					</table>				   
				</div>
			</c:if>
			<div id="order-list">
				<h2>최근 주문</h2>
				<div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>주문일</th>
								<th>상품명</th>
								<th>주문번호</th>
								<th>상품금액</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${orderList}" var="o">
							<tr>
								<td>${o.orderDate}</td>
								<td>${o.productName }</td>
								<td>${o.orderNo }</td>
								<td>${o.total}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>
		function removeLike(pno, btn){
			$.ajax({
				url : 'delete.like',
				type : 'get',
				data :{productNo : pno, userNo : '${sessionScope.loginUser.userNo}'},
				success : e=>{
					$(btn).parents('.like-product').css('display', 'none');
				},
				error : () =>{
					console.log('에이젝스 시렁');
				}
			});
		};
	</script>
<jsp:include page="../common/footer.jsp"/>	
</body>
</html>