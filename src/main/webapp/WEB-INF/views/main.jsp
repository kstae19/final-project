<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  	
<meta charset="UTF-8">
<title>Eco Friendly</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- swiper.js 라이브러리 추가 -->
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<link rel="icon" href="resources/images/common/1968582-28a745.png" type="image/x-icon">
<style>

	#placeholder{
		width : 1200px;
		height : 775px;
		margin:auto;
	}
	
	.swiper {
	    width: 1200px;
	    height: 700px;
	    margin:auto;	
	}
	
	.swiper-slide>img {
	    width : 90%;
	    height : 100%;
	    margin-left: 60px;
	}
	
	div[class^=swiper-button] {
    	color : #28a745;
    	/* display : none; */ /* 아니면 안보이게 숨기기도 가능 */
	}
	/* 슬라이드 바색 변경 (기본색은 파란색) */
	.swiper-pagination-bullet { 
	    width: 12px; height: 12px; background: transparent; border: 1px solid #28a745; opacity: 1; 
	}
	.swiper-pagination-bullet-active { 
	    width: 40px; transition: width .5s; border-radius: 5px; background: #28a745; border: 1px solid transparent; 
	}
	
</style>
</head>
<body>
	<jsp:include page="common/header.jsp" />
	<div id="placeholder">
	        <!-- Slider main container -->
        <div class="swiper">
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper">
                <!-- Slides -->
				<div class="swiper-slide"><img src="https://img.freepik.com/free-photo/top-view-eco-friendly-sign-on-grass_23-2148576687.jpg?w=996&t=st=1701756983~exp=1701757583~hmac=7c629f853b28e24fe5881373f947578062b1bd1025abc4da1f6f9d146f9199f8"></div>
                <div class="swiper-slide"><img src="resources/images/cookieChunsik.jpg"></div>
                <div class="swiper-slide"><img src="https://i.namu.wiki/i/5Pzn_q6HLWhHXTbvNXQ3zNji9mVq1Itvy0vQ7asrjChUTw-w0FrL4aBgHhpWVOHO-aGvL4r8Fx33iO0deFAmiQ.gif"></div>
                <div class="swiper-slide"><img src="https://24.media.tumblr.com/63adaad6e42913a0543b427db715878e/tumblr_n3zhs6QIRp1tq47ppo1_500.gif"></div>
                <div class="swiper-slide"><img src="resources/images/christmasChunsik.jpg"></div>
                <div class="swiper-slide"><img src="https://img.freepik.com/free-photo/digital-screen-with-environment-day_23-2148884835.jpg?w=996&t=st=1701660083~exp=1701660683~hmac=7f62555cfc2a6f75830645b7611b2a8b50c1e8748b5b665628558c8b64eeb824"></div>
            </div>
        
            <!-- If we need pagination -->
            <div class="swiper-pagination"></div>
        
            <!-- If we need navigation buttons -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        
            <!-- If we need scrollbar -->
            <!-- <div class="swiper-scrollbar"></div> -->
        </div>
	
	</div>
	<script>
	    // 슬라이더 동작 정의
	    const swiper = new Swiper('.swiper', {
	        autoplay : {
	            delay : 3000 // 3초마다 이미지 변경
	        },
	        loop : true, //반복 재생 여부
	        slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
	        pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
	            el: '.swiper-pagination',
	            clickable: true
	        },
	        navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
	            prevEl: '.swiper-button-prev',
	            nextEl: '.swiper-button-next'
	        }
	    }); 
	
	    $(".swiper-pagination").on("click", function(){
	        swiper.autoplay.start();
	    })
	
	    $(".swiper-button-prev").on("click", function(){
	        swiper.autoplay.start();
	    })
	
	    $(".swiper-button-next").on("click", function(){
	        swiper.autoplay.start();
	    })
	</script>
	
<jsp:include page="common/footer.jsp" />
</body>
</html>