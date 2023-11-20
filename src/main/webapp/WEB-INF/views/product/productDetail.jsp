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
	border : 1px solid transparent;
}

.product-content {
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
	height: 90px;
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
	padding-top:10px;
}
#like>img{
	width: 40px;
	height:40px;
}
#star {
	width: 100%;
	height: 45%;
	text-align:center;
	padding:5px;
}
#choice input, select{
	width: 70%;
	height: 30px;
	border: none;
	margin-left:20px;
	margin-right:20px;
}
#choice p{
	text-align:center;
	color:orangered;
	padding:0;
	margin:0;
}
#picture-area {
	width: 100%;
}

#picture-area>img {
	width: 800px;
	height: 600px;
	margin-left : 100px;

}
.detail-info, .extra-info{
	width : 800px;
	margin:auto;
}
#review-area>h2{
	cursor:pointer;
}
.fakebtn{
	border-radius:5px;
	background:beige;
	padding:1px;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="product-content">
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
					<c:choose>
						<c:when test="${empty sessionScope.loginUser}">
							<div id="like"><img onclick="askLogin();" src="resources/images/heart-regular.svg"></div>
						</c:when>
						<c:when test="${like eq 'N' }">
						<div id="like"><img onclick="like(${p.productNo}, this);" src="resources/images/heart-regular.svg"></div>
						</c:when>
						<c:otherwise>
						<div id="like"><img onclick="like(${p.productNo}, this);" src="resources/images/heart-solid.svg"></div>
						</c:otherwise>
					</c:choose>
						<div id="star">
						<a href="product.review?productNo=${p.productNo }">${review.starRate }/5</a>
						 (${review.reviewNo }개) 
						</div>
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
							
							<input type="number" value="1" min="1" max="10" required disabled>
							<span id="totalPrice"></span><br>
							
							<br>
						<c:choose>
						<c:when test="${!empty sessionScope.loginUser }">	
							<button type="button" onclick="addCart();">장바구니 추가</button>
							<button type="submit">구매하기</button>
						</c:when>
						<c:otherwise>
							<p>로그인 후 상품 주문이 가능합니다.</p>
						</c:otherwise>
						</c:choose>
						</form>
					</div><!-- 옵션 선택 영역 끝 -->
				</div><!-- 제품 설명영역 끝 -->
			</div>
		</div>
				<script>
					function addCart(){
						let $option = $('#choice select').val();
						if($option == 0){
							alert('상품 옵션을 선택해주세요.');
							return false;
						}
						else{
							$.ajax({
								url : 'add.cart',
								method : 'POST',
								data : {
									userNo : '${sessionScope.loginUser.userNo}',
									optionNo : $option,
									qty : $('#choice input[type=number]').val()
								},
								success : e =>{
									if(e == 'added'){
										alert('장바구니에 추가되었습니다.');
									}
									else if(e == 'failed'){
										alert('장바구니 추가에 실패했습니다. 다시 한 번 도전해주세요.');
									}
									else{
										alert('이미 장바구니에 존재하는 상품입니다.\n 추가일자 :'+e);
									}
								},
								error : ()=>{
									console.log('ajax망..'); 
								}
								
							})
							
						}
						
					}
					function askLogin(){
						if(confirm('로그인이 필요한 기능입니다. 로그인 화면으로 이동하시겠습니까?')){
						location.href='login';
						}
					}
					function like(pno, th){
						console.log(pno);
						$.ajax({
							url : 'product.like',
							data : {
								productNo : pno,
								userNo : '${sessionScope.loginUser.userNo}'
							},
							success : e => {
								if(e == 'added'){
									$(th).attr('src', 'resources/images/heart-solid.svg');
								}
								else if(e == 'removed'){
									$(th).attr('src', 'resources/images/heart-regular.svg');
								};
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
									$('#totalPrice').text(price+'원');
									$('#choice input').attr('disabled', false);
								},
								error : ()=>{
									console.log('공부 더해 이자기식아!');
								}
							})
						});

						$('#choice input').change(()=>{
							if($('#choice select').val() == 0){
								alert('옵션을 먼저 선택 해주세요.');
								$('#choice select').focus();
							}else{
								
							let price = $('#choice span').text();
							let totalPrice =parseInt(price.replace(',', ''))*parseInt($('#choice input').val());
							$('#totalPrice').text(totalPrice.toLocaleString()+'원');
							}
							
						})
					})
				</script>
		<div id="picture-area">
			<div class="detail-info">
				<h3>상품 설명</h3>
				<p>${p.detailInfo }</p>
			</div>
			<hr>
				<c:if test="${empty images }">
				<h3 align ="center"> 상세 이미지가 없습니다. </h3>
				</c:if>
			<c:forEach items="${images }" var="img">
				<img src="${img}">
				<br>
			</c:forEach>
			<hr>
			<div class="extra-info">
				<h3>상품 정보</h3>
				<p>${p.extraInfo }</p>
			</div>
		</div>
		<hr>
		<div id="review-area">
			 <c:choose>
			 	<c:when test="${empty review.reviewNo}">
			 		<h2>상품 리뷰가 없습니다.</h2>
			 	</c:when>
			 	<c:otherwise>
			 		<h2 onclick="showReviews();">리뷰 보기(${review.reviewNo }개)</h2>
			 	</c:otherwise>			 	
			 </c:choose>
			 <div></div>
		</div>
		<script>
			function showReviews(){
				$.ajax({
					url:'product.review',
					data:{productNo:${p.productNo}},
					success: reviews => {
						let value = '<div><table><tbody>';
						for(let i in reviews){
							value += '<tr>'
								+ '<td><span class="fakebtn">'+reviews[i].option+'</span> <b>'+reviews[i].reviewTitle+'</b></td>'
								+'</tr>'
								+'<tr>'
								+ '<td>'+reviews[i].reviewContent+'</td>'
								+'</tr>';	
						}
						value += '</tbody></table></div>';
						$('#review-area>div').html(value);
					},
					error:()=>{
						alert('지겨웡~~~~~~~~~~');
					}
				});
			}
		</script>
	</div>
	
	<br><br><br>
	<br><br><br>
	<br><br><br>
	<br><br><br>
</body>
</html>