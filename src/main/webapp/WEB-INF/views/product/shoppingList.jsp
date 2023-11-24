<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역 조회</title>
<style>
	.order{
		width : 1000px;
		height :200px;
		border:1px solid orange;
	}
</style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>
	
	<div>
		<div class="order">주문</div>
		<div class="order">주문</div>
		<div class="order">주문</div>
		<div class="order">주문</div>
		<div class="order">주문</div>
		<div class="order">주문</div>
		<div class="order">주문</div>
		<div class="order">주문</div>

	</div>


</body>
</html>