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
<!-- Alertify -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>

<style>
@font-face {
	font-family: 'SBAggroB';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
*{
	border : 1px solid transparent;
}
div {
	box-sizing: border-box;
	margin: 0;
	padding: 0;

}
ul{
	list-style:none;
	padding:0px;
	margin:0px;
}
#keyword-list>li{
	cursor:pointer;
}

.outer {
	height: 1100px;
}
.content {
	width: 1200px;
	height: 1000px;
	margin: auto;
}

#searching-area {
	height: 50px;
	width: 400px;
	margin: auto;
}

#searching-area input[type=text] {
	width: 80%;
	height: 90%;
	border-left-width: 0;
	border-right-width: 0;
	border-top-width: 0;
	border-bottom-width: 0;
	background:beige;
}
#searching-area button{
	width : 40px; 
	height 40px;
	background : none;
	border : none;
}
#searching-area img {
	width: 90%;
	height: 90%;
	float: right;
	cursor : pointer;
}

#controll-area>select {
	margin-left: 737px;
	padding: 5px;
	font-size: 20px;
}

#controll-area>button {
	padding: 5px;
	margin-left: 5px;
	border-radius: 5px;
	border: none;
	color: white;
	font-size: 20px;
}

#product-area {
	margin-top : 20px;
	font-family: 'SBAggroB';
	width: 100%;
}

#products {
	width: 100%;
}
.product {
	float:left;
	width: 393px;
	height: 400px;
	cursor:pointer;
	margin:2px;
}
.product-info{
	width:100%;
	height:310px;
}

.product table {
	display: none;
	padding-top: 50px;
	padding-left: 100px;
	text-align:center;
}
.like-cart{
	width:100%;
	height:70px;
	padding:10px;
}
.like-cart>img{
	width : 40px;
	height:40px;
}

.product h1 {
	color: rgb(205, 205, 154);
	font-size: 40px;
	font-weight:300;
	text-align: center;
	line-height: 300px;
}
.paging-area{
	padding-top : 50px;
	margin:auto;
	clear:both;
}
.paging-area>ul{
	list-style : none;
	display:flex;
	padding-left:600px;
}
.paing-area li{
	width : 20px;
	height:20px;
}
.keyword{
	width:315px;
	height : 25px;
	background:beige;
	position:relative;
	display:flex;
}
.keyword>button{
	width:20px;
	height:20px;

}
.keyword>div{
	width:280px;
}
.btn-selected{
	background:#466D1D;
}
.btn-not{
	background: #98BF64;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<br><br>
	<div class="outer">
		<br> <br>
		<div class="content">
			<div id="searching-area">
			<form action = "product" method="get">
			<c:choose>
				<c:when test="${not empty map.orderBy }">
					<input type="hidden" name = "orderBy" value="${map.orderBy}"> 
				</c:when>
				<c:otherwise>
					<input type="hidden" name = "orderBy" value=""> 
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${not empty map.keyword }">
				<input type="text" name = "keyword" placeholder="${map.keyword} " oninput="keywords();"> 
				</c:when>
				<c:otherwise>
				<input type="text" name = "keyword" placeholder="검색어를 입력하세요." oninput="keywords();"> 
				</c:otherwise>
			</c:choose>
				<button type="submit">
				<img src="resources/images/searhIcon.svg">
				</button>
				<ul id="keyword-list"></ul>	
			</form>
			
			</div>

			<div id="controll-area">
				<button id="F" class="btn-not" onclick="sort(this);">FOOD</button>
				<button id="G" class="btn-not" onclick="sort(this);">Eco Friendly Items</button>
				<button id="all" class="btn-not" onclick="sort(this);">ALL</button>
				<select>
					<option value="latest">최신순</option>
					<option value="view">조회순</option>
					<option value="like">좋아요순</option>
					<option value="priceDesc">가격 높은순</option>
					<option value="priceAsc">가격 낮은순</option>
				</select>
			</div>
			<script>
				$(()=>{
					
				})
			</script>
			<div id="product-area">
				<div id="products">
					<c:forEach var="p" items="${productList }">
						<div id="${p.productNo }" class="product">
									
							<c:choose>
							<c:when test="${empty loginUser }">
								<div class="product-info" 
								onclick="location.href='product.detail?userNo=0&productNo='+${p.productNo}">
							</c:when>
							<c:otherwise>		
								<div class="product-info" 
								onclick="location.href='product.detail?userNo='+${sessionScope.loginUser.userNo }+'&productNo='+${p.productNo}">
							</c:otherwise>
							</c:choose>
								<h1>${p.productName }</h1>
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
										</tr>
									</tbody>
								</table>
							</div>
							
							<div class="like-cart">
									<c:choose>
									<c:when test="${empty sessionScope.loginUser }">
										<img onclick="askLogin();" src="resources/images/heart-regular.svg">
									</c:when>
									<c:otherwise>
										<img onclick="like(${p.productNo}, this);" src="resources/images/heart-regular.svg">
									</c:otherwise>
									</c:choose>
							</div>
							
						</div><!-- product class-->
						
							
						<script>
							$(function() {
								$('#${p.productNo}').css({
									"background-image" : "url(${p.mainImg})",
									"background-size" : "cover",
									"opacity" : "0.9"
								}).hover(()=>{
									$('#${p.productNo} h1').css("display", "none");
									$('#${p.productNo} table').css('display', 'block');
								}, ()=>{
									$('#${p.productNo} table').css("display", "none");
									$('#${p.productNo} h1').css('display', 'block');
								});
							})
						</script>
					</c:forEach>
					
					</div>
				</div>
				
				<script>
					function keywords(){
						$.ajax({
							url : 'getKeywords',
							type : 'get',
							data : {keyword:$('input[name=keyword]').val()},
							success : e =>{
								let str = '';
								for(let i in e){
									str += '<li onmouseover="setKeyword(this);">'
										+ '<div class="keyword">'
										+ '<div>'+e[i] +'</div>'
										+ '<button onclick="removeKeyword(this);"> X </button>'
										+'</div>'
										+'</li>';
								}
								$('#keyword-list').html(str);
							},
							error : ()=>{
								console.log('망해따..');
							}
						});
					};
					function removeKeyword(btn){
						$(btn).parents('li').empty();
					};
					function setKeyword(li){
						$('input[name=keyword]').val($(li).children().children('div').text());				
					};
					function sort(btn){
						location.href='product?category='+btn.id;
					};
					function askLogin(){
						alertify.confirm('로그인','로그인이 필요한 기능입니다. 로그인 화면으로 이동하시겠습니까?',
								()=>{
									location.href='login';
								},
								()=>{
									alertify.error('비회원으로 계속합니다.');
								});
					};
					
					function like(pno, th){
						console.log(pno);
						$.ajax({
							url : 'product.like',
							data : {
								productNo : pno,
								userNo : '${sessionScope.loginUser.userNo}'
							},
							success : e => {
								let value = '';
								value = e=='added'? 'resources/images/heart-solid.svg' : 
										(e=='removed'? 'resources/images/heart-regular.svg': '');
								if(value != '') $(th).attr('src', value);
							}
						})
					};
					
					$(()=>{
						$('#controll-area>button[id="${map.category}"]')
						.removeClass("btn-not")
						.addClass("btn-selected");
						
						$.ajax({
							url : 'getLikes.pr',
							data : {userNo : '${sessionScope.loginUser.userNo}'},
							success: result =>{
								for(let i in result){
									$('.product').each((index, item)=>{
										if(result[i].productNo == item.id){
										$(item).find('.like-cart>img').attr('src', 'resources/images/heart-solid.svg');
											
										}
									})
								}
							}
						});
						
						$('#controll-area>select').change(e =>{
							location.href='product?category='+'${map.category}'+'&orderBy='+$(e.target).val();
						});						
					})
				</script>
				<c:if test = "${!empty loginUser}">
					<script>

					</script>
				</c:if>
				<c:if test="${not empty map.orderBy }">
					<script>
						$(()=>{
							$('#controll-area option[value="${map.orderBy}"]').attr('selected', true);
						})
					</script>
				</c:if>			
			<div class="paging-area">
				<ul>
				<c:choose>
					<c:when test="${pi.currentPage eq 1 }">
					<li><a disabled> &lt; </a></li>
					</c:when>
					<c:when test="${not empty keyword and not empty category }">
					<li><a href="product?keyword=${keyword }&category=${category }&cPage=${pi.currentPage-1 }"> &lt; </a></li>
					</c:when>
					<c:otherwise>
					<li><a href="product?cPage=${pi.currentPage-1 }"> &lt; </a></li>
					</c:otherwise>
				</c:choose>	
					
					<c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
					<c:choose>
						<c:when test="${pi.currentPage eq p }">
							<li><a disabled> ${p } </a></li>
						</c:when>
						<c:when test="${not empty keyword and not empty category }">
							<li><a href="product?keyword=${keyword }&category=${category}&cPage=${p}"> ${p } </a></li>
						</c:when>
						<c:otherwise>
							<li><a href="cPage=${p}"> ${p } </a></li>
						</c:otherwise>
                   </c:choose>
                    </c:forEach>
                    
                <c:choose>
					<c:when test="${pi.currentPage eq pi.maxPage }">
					<li><a disabled> &gt; </a></li>
					</c:when>
					<c:when test="${not empty keyword and not empty category }">
					<li><a href="product?keyword=${keyword }&category=${category }&cPage=${pi.currentPage-1 }"> &gt; </a></li>
					</c:when>
					<c:otherwise>
					<li><a href="product?cPage=${pi.currentPage+1 }"> &gt; </a></li>
					</c:otherwise>
				</c:choose>	    
                </ul>
			</div>
			</div>
			
		</div>
	</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>