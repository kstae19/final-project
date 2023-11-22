<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	border : 1px solid orange;
}
.outer {
	height: 1100px;
	width:1200px;
	display:flex;
	margin:auto;
}
.content {
	width: 100%;
	height: 1000px;
}
#orderlist-title{
	width:100%;
	height:50px;
}
#orderlist-title>span{
	font-weight:700;
	padding : 2px 880px 2px 10px;
	font-size:25px;
}
#orderlist-title>a{
	font-size : 20px;
	text-decoration:none;
}
#orderlist>ul{
	list-style : none;
	padding:0;
	margin:2;
}
.order{
	width:90%;
	text-align:center;
	margin:5px 50px 5px 50px;
	background : beige;
}
.order img{
	width :140px;
	height: 120px;
}

</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="outer">
	<br><br>
	<div class="content">
		<div id="orderlist-title">
			<span>주문내역 상세조회</span>
			<a href="#">내 후기 확인</a>
		</div>
		<div id="orderlist">
			<ul>
				<li>
			<table class="order">
				<thead>
					<tr>
					<th>주문일자 2023-10-10</th>
					<th colspan="2"></th>
					<th> 주문번호 10</th>
					</tr>
				</thead>		
				<tbody>
					<tr>
					<td rowspan="4"><img src="resources/images/cookieChunsik.jpg"></td>
					<td>라이언 프랜즈</td>
					<td rowspan="4">3,000원</td>
					<td rowspan="3">결제 완료</td>
					</tr>
					
					<tr>
					<td>크리스마스 쿠키 춘식이 인형</td>
					
					</tr>
					
					<tr><td>Medium 사이즈</td></tr>
					
					<tr>
					<td>1,800원 /1개</td>
					<td><button>후기 쓰기</button><button>문의</button></td>
					</tr>
					
					<tr></tr>
				</tbody>	
			</table>
				</li>
				<li>
			<table class="order">
				<thead>
					<tr>
					<th>주문일자 2023-10-10</th>
					<th colspan="2"></th>
					<th> 주문번호 10</th>
					</tr>
				</thead>		
				<tbody>
					<tr>
					<td rowspan="4"><img src="resources/images/cookieChunsik.jpg"></td>
					<td>라이언 프랜즈</td>
					<td rowspan="4">3,000원</td>
					<td rowspan="3">결제 완료</td>
					</tr>
					
					<tr>
					<td>크리스마스 쿠키 춘식이 인형</td>
					
					</tr>
					
					<tr><td>Medium 사이즈</td></tr>
					
					<tr>
					<td>1,800원 /1개</td>
					<td><button>후기 쓰기</button><button>문의</button></td>
					</tr>
					
					<tr></tr>
				</tbody>	
			</table>
				</li>
			</ul>
		</div>
	</div>
</div>	
</body>
</html>