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
	
<style>
body>div{
	display:flex;
}
div {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	border : 1px solid orange;
}
.menu-left{
	width:200px;
	height:1400px;
	margin-left:auto;
}
.product-content {
	width: 1000px;
	height : 1400px;
	margin-right: auto;
}
.review{
	width:100%;
	margin:5px;
	padding :5px;
	display: flex;
	align-items: center;
	justify-content: center;
}
.main-img{
	width:30%;
	height:100%;
}
.main-img>img{
	width:100%;
	height:100%;
}
.review-content{
	width:70%;
	height:100%;
}
.review-content>table{
	width:100%;
}
.review-content tbody>tr{
	height:200px;
}
</style>
	
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div>
	<div class="menu-left"></div>
	<div class = "product-content">
		<h1>상품 후기</h1>
		<div class="review">
			<div class="main-img"><img src="resources/images/product/chocolaCokie1.jpg"/></div>
			<div class="review-content">
				<table border="1">
					<thead>
						<tr>
							<th>리뷰 제목</th>
							<th>별점</th>
						</tr>
						<tr>
							<td colspan="2">옵션명</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3">어쩌고 저쩌고 후기내용 룰루랄라</td>
						</tr>
					</tbody>
				</table>
			</div>
			<c:forEach items="reviews" var="r">
							<div class="review-content">
				<table border="1">
					<thead>
						<tr>
							<th>${r.reviewTitle }</th>
							<th>${r.starRate }/5</th>
						</tr>
						<tr>
							<td colspan="2">${r.option }</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3">${r.reviewContent }</td>
						</tr>
					</tbody>
				</table>
			</div>
			</c:forEach>
		</div>
	</div>
	</div>
</body>
</html>