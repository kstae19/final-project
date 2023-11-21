<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
#criteria>div{
text-align : center;
font-size:18px;

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
.qty>input{
	padding:5px 2px 5px 10px;
	width:30px;
	text-align:center;
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

		 <form action="listOrderForm" method="post">
		 <c:choose>
		 	<c:when test="${empty cartItems }">
		 	<div class="item">
			<span><input type="checkbox" disabled></span>
				<div class="item-info">		
				</div>
				<div class="qty">아이템을 추가하세요.</div>
				<div class="price">가격 
				</div>
		 	</c:when>
		 	<c:otherwise>
			<c:forEach items="${cartItems}" var="i" varStatus="status">
			<div class="item">
			<span><input type="checkbox"></span>
				<div class="item-info">
					<!-- 상품 메인 이미지 -->
					<img src="${i.mainImg }">
					
					<!-- 상품 정보 -->
					<div>
						<a href="#" class="brand-${i.brandNo }">${i.brandName }</a> 
						<a href="product.detail?productNo=${i.productNo }" class="product-name"><h3>${i.productName }</h3></a>
						<div>${i.productInfo }</div>
						<span class="option ${i.optionNo }">${i.optionName }</span>
						<div class="price-one">${i.price }원</div>
					</div>
				</div>
					<!-- 수량정보 및 삭제버튼-->
				<div class="qty">
					<button onclick="qtyChange(-1, this);">-</button>
					<input type="number" min="1" max="10" value="${i.qty }" readonly>
					<button onclick="qtyChange(1,this);">+</button>
					<br>
					<button onclick="removeItem(this);">삭제하기</button>
				</div>
					<!-- 가격정보 및 구매버튼-->
					
				<div class="price">
					<span>${i.price * i.qty}원</span> 
					<br>
					<input type="hidden" name="itemList[${status.index }].mainImg" value="${i.mainImg }">
					<input type="hidden" name="itemList[${status.index }].productNo" value="${i.productNo }">
					<input type="hidden" name="itemList[${status.index }].productName" value="${i.productName }">
					<input type="hidden" name="itemList[${status.index }].optionName" value="${i.optionName }">
					<input type="hidden" name="itemList[${status.index }].optionNo" value="${i.optionNo }">
					<input type="hidden" name="itemList[${status.index }].qty" value="${i.qty }"/>
					<input type="hidden" name="itemList[${status.index }].price" value="${i.price }"/>
					<input type="hidden" name="userNo" value="${sessionScope.loginUser.userNo }">
					<button type="button" onclick="orderthis(${i.optionNo },${i.qty },${sessionScope.loginUser.userNo });">이 상품 구매하기</button>
				</div>
		</div>
		</c:forEach>
		 	</c:otherwise>
		 </c:choose>
		 
		 <c:if test="${!empty cartItems }">
		 <div>
		 	<button type="submit">
		 		전체 주문하기
		 	</button>
		 </div>
		 </c:if>
		</form>
		<script>

			function orderthis(optionNo, qty, userNo){
					location.href="orderForm?optionNo="+optionNo+"&qty="+qty+"&userNo="+userNo;
			}
			function qtyChange(num, btn){
				let $qtyspan = $(btn).siblings('input');
				$qty = Number($qtyspan.val());
				$option = $(btn).parents('.item').find('span[class^=option]');
				if(num != -1){
					if($qty >=10){
						alert('최대 수량은 10개입니다.');
						return false;
					}
					$qty +=1;
				}
				else{
					if($qty <=1){
						alert('최소 수량은 1개입니다.');
						return false;
					}
					$qty -=1;
				}
				$.ajax({
					url:'update.cart',
					method : 'POST',
					data :{userNo:'${sessionScope.loginUser.userNo}',
						  optionNo : $option.attr('class').substring(7),
						  qty : $qty},
					success: e=>{
						console.log(e);
						$qtyspan.val($qty);
					},
					error : ()=>{
						console.log('ajax망..');
					}
				});
				
			};

			function removeItem(btn){
	
				$item = $(btn).parents('.item');
				$.ajax({
					url : 'remove.item',
					method : 'POST',
					data : {
						userNo : '${sessionScope.loginUser.userNo}',
						optionNo : $item.find('span[class^=option]').attr('class').substring(7)
					},
					success: e =>{
						console.log(e);
						if(e=='completed'){
							alert('삭제되었습니다.');
							$item.empty();
						}
						else{
							alert('삭제 실패..');
						}
					},
					error : ()=>{
						console.log('에이젝스 망이야');
					}
				})
			};
			

		</script>
	</div>
</div>



</body>
</html>