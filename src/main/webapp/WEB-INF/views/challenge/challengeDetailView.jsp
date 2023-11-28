<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
 <!-- css -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- javascript -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- overal -->
<style> 
    #wrapper{
		border : 1px solid teal;
        width: 1200px;
       
       margin: auto;
        background-color: white;
    }


    #search-area{
       border : 1px solid teal;
    }
    #header-area{
    	border : 1px solid yellow;
       width : 100%;
       height : 15%;
       display : flex;
       justify-content: space-around;
       align-items: center;
    }

    #content-area{
		
       border : 1px solid teal;
        height : 40%; 
        width : 100%;
        
       display : flex;
       justify-content: space-around;
       align-items: center;
    }
    
    #achievement-area{
        border : 1px solid red;
        height : 40%; 
        width : 100%;
    }

</style>

  </head>
  <body>
 	<jsp:include page="../common/header.jsp" />
 	
    <div id="wrapper">
    	<header id="header-area">
    		<h1>${ challenge.challengeTitle }</h1>
    		<h6>${ categoryName }</h6>
    		<h6>${ userId }</h6>
    	</header>
    	
    	<section id="content-area">
    		<article id="content-text">
    			${ challenge.challengeContent }
    		</article>
    		<article id="content-img">
    			<img src="${ challenge.changeName }" />
    		</article>
    		
    		<article id="participants">
    			${ challenge.minParticipant } ~ ${ challenge.maxParticipant }
    		</article>
    		
    		
    		<article id="likeCount"><!-- 로그인유저가 좋아요체크한 회원이면 💚로 보이기 -->
    			<c:choose>
	    			<c:when test="${ not empty sessionScope.loginUser }"> 
	    				<button id="like"></button>
	    			</c:when>
	    			<c:otherwise>
	    				<button disabled>🤍</button>
    				</c:otherwise>
    			</c:choose>
    				<div id="count">${ likeCount }</div> 
    		</article>
    		
    		
    		<script>
    		// 1. 전역함수 선언
    			var checkLikeCount = function(){
	    					console.log('checkLikeCount때 : ${likeCount}');
			    			var deferred = $.Deferred();
			    			
			    			$.ajax({
			    				url : 'checkLike.ch',
			    				data : {
			    					userNo : ${ sessionScope.loginUser.userNo },
			    					challengeNo : ${ challenge.challengeNo }
			    				},
			    				// 체크여부 확인 완료
			    				success : function(data){ 
			    					deferred.resolve(data);
			    					console.log('체크여부 확인 완료');
			    					if(data == 'success'){ // 체크한 회원이면
			    						$('#like').html('💚');
			    					} else{
			    						$('#like').html('🤍');
			    					}
			    				},
			    				// 체크여부 확인 불가
			    				error : function(err){
			    					deferred.reject(err);
			    				}
			    				
			    			});
		    			
		    			return deferred.promise();	
		    		};// checkLikeCount
		    		
		    // 2. 페이지 로드되자마자 실행될 것
    			$(function(){
    				
    				checkLikeCount();
    			
    			}); // jQuery끝
    			
    		
    			// Promise를 써야 ajax비동기를 동기로 사용할 수 있음 
    			// 만약 초기ajax success에 ajax를 쓴다면 동기로 처리되는 것이 아니라 그대로 비동기로 처리됨
    			//	$('#content-area').on('click', '#likeCount', function(){
    					
    		  $(function(){		
				// 클릭이벤트함수
				$('#like').on('click',  function(){
			    		
					checkLikeCount()
		    		.done(function(checked){// 체크여부 확인 완료했을 때
		    			
		    			const count = parseInt($('#count').html()); 
		    		
					    			if(checked == 'success'){ // 이미 체크한 회원이라면
					    				console.log('done때 : ${likeCount}');
						    				$.ajax({
				    		    				url : 'deleteLike.ch',
				    		    				data : {
				    		    					userNo : ${ sessionScope.loginUser.userNo },
				    		    					challengeNo : ${ challenge.challengeNo },
				    		    				},
				    		    				success : function(result){ // deleteLike 연결 성공
				    		    					
				    		    					console.log(result);
				    		    				
				    		    					if(result == 'success' ){// 좋아요 한행 삭제 성공
				    		    						
				    		    						console.log('좋아요 한행 삭제 성공');
				    		    						//$('#count').html(${likeCount}-1);// 디테일화면에 들어왔을 때 로드되는 좋아요수
				    		    						$('#count').html(count - 1);
				    		    						$('#like').html('🤍');
				    		    						
				    		    					} else {
				    		    						console.log('좋아요 한행 삭제 실패');
				    		    					}
				    		    				},
				    		    				error : function(){
				    		    					
				    		    					console.log('decraese연결 실패');
				    		    					
				    		    				}
					    				})
					    			}//if 
					    			else { // 처음 체크하거나 취소후 재체크하는 회원이라면
					    				
						    				$.ajax({
							    				url : 'insertLike.ch',
							    				data : {
							    					userNo : ${ sessionScope.loginUser.userNo },
							    					challengeNo : ${ challenge.challengeNo },
							    				},
							    				success : function(result){ // insertLike에 연결 성공
							    					
							    					console.log(result);
							    				
							    					if(result == 'success'){ // 좋아요 한행 추가 성공
							    						console.log('좋아요 한행 추가 성공');
							    						$('#count').html(count + 1);
							    			
							    						//$('#count').html($ {likeCount} + 1);
							    						$('#like').html('💚');// + 는 String끼리 concat 하는 효과
							    					} else {
							    						console.log('좋아요 한행 추가 실패')
							    					}
			
							    				},
							    				error : function(){					
							    					console.log('increase연결 실패'); 
							    				}
					    			})
					    			
					    			}// else	

					    		})// done
						    	.fail(function(message){// 체크여부 확인 실패했을 때
						    			console.log('좋아요수 체크 실패');
						    	});// fail
				});// 클릭이벤트함수
    		  })//jQuery끝
    		
    	
    		
   
    		
    		
    		
    		
    		
    		
    		
    		
    		/* $('#likeCount').on('click', function(e){
			    		new Promise( (resolve, reject) => {
			    			
			    			$.ajax({
			    				url : 'checkLike.ch',
			    				data : {
			    					userNo : ${ loginUser.userNo },
			    					challengeNo : ${ challenge.challengeNo }
			    				},
			    				success : function(data){ 
			    					resolve(data);
			    				},
			    				error : function(){
			    					
			    				}
			    				
			    			});
			
			    		})
			    		.then( (arg)  => {
			    			
			    			$.ajax({
			    				url : 'increaseLike.ch',
			    				data : {
			    					userNo : ${ loginUser.userNo },
			    					challengeNo : ${ challenge.challengeNo },
			    				},
			    				success : function(result){
			    					
			    					console.log("좋아요 증가 성공");
			    				},
			    				error : function(){					
			    					console.log('좋아요 증가 실패'); 
			    				}
			    		})
    				})
    				.then( (arg)  => {
			    			
			    			$.ajax({
			    				url : 'decreaseLike.ch',
			    				data : {
			    					userNo : ${ loginUser.userNo },
			    					challengeNo : ${ challenge.challengeNo },
			    				},
			    				success : function(result){			
			    					console.log("좋아요 감소 성공");
			    				},
			    				error : function(){		
			    					console.log('좋아요 감소 실패');	
			    				}
			    		})
    				})
    		}) */
    		
    		
    	/* 	$(function(){
    			
    			
				// 클릭했을 때 이벤트    		
    		
    				
    				checkLikeCount();


    			});
    			
				
    			// 좋아요 했는지 확인
    			function checkLikeCount(){
        			
        			$.ajax({
        				url : 'checkLike.ch',
        				data : {
        					userNo : ${ loginUser.userNo },
        					challengeNo : ${ challenge.challengeNo }
        				},
        				success : function(data){ 
        
        					console.log(data);
        				},
        				error : function(){
        					console.log('좋아요 했는지 여부 확인불가');
        				}
        				
        				
        				
        			});
        			
        			
        		};
        			
        		// 좋아요 증가함수
        		function increaseLikeCount(){
    	
    		    			$.ajax({
    		    				url : 'increaseLike.ch',
    		    				data : {
    		    					userNo : ${ loginUser.userNo },
    		    					challengeNo : ${ challenge.challengeNo },
    		    				},
    		    				success : function(result){
    		    					
    		    					console.log("좋아요 증가 성공");
    		    				},
    		    				error : function(){
    		    					
    		    					console.log('좋아요 증가 실패');
    		    					
    		    				}
    		    			
    		    		
    	
    	
        			})
        		
        		};

        		// 좋아요 감소함수
        		function decreaseLikeCount(){
    	
    		    			$.ajax({
    		    				url : 'decreaseLike.ch',
    		    				data : {
    		    					userNo : ${ loginUser.userNo },
    		    					challengeNo : ${ challenge.challengeNo },
    		    				},
    		    				success : function(result){
    		    					
    		    					console.log("좋아요 감소 성공");
    		    				},
    		    				error : function(){
    		    					
    		    					console.log('좋아요 감소 실패');
    		    					
    		    				}

    	
        			})
        		
        		};
        		
    		}) */
		    </script>
		    		
    		
    		<c:if test="${  loginUser.userNo eq challenge.userNo }">
    			<button><a href="#">수정</a></button><button><a href="#">삭제</a></button>
    		</c:if>
    		
    	</section>
    
    	<section id="achievement-area">
    	
    		<article id="achievement-enroll" >
    			<textarea style="resize:none">
    			
    			</textarea>
    			<button><input type="file">첨부파일</button>
    			<button>인증</button>
    			<button>내 인증글만 보기</button>
    		</article>
    		
    		<article id="achievement-list">
    			
    			<div class="achievement-item">
    				<img src="data:image/jpeg;base64,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" />
    				<div id="achievement-content">
    				</div>
    				<button>답글달기</button>
    				<button>신고하기</button>
    			</div>
    			
    		</article>
    	
    	</section>
	
    	
    <!-- content -->
    <style>
    #likeCount{
    	border : 1px solid black;
    }
    </style>
    
    <!-- achievement  -->
	<style>
	#achievement-list{
      	display : grid;
      	justify-content : center;
      	align-items:center;
      	
        grid-template-columns : 400px 400px;
        grid-row: auto auto;
        
      	grid-column-gap: 100px;
  		grid-row-gap: 50px;

	}
	#no-item{
		display : flex;
	 	align-items:center;
	    justify-content:center; 
	    border : 1px solid black;
	}
	.achievement-item{
	    align-items:center;
	    justify-content:center; 

	}
	</style>
    
    </div>

    </body>
    </html>