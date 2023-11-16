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

<!-- overal -->
<style>
    #wrapper{
		border : 1px solid teal;
        width: 1200px;
        height: 1000px; 
       margin: auto;
        background-color: white;
    }

    #search-area{
    	border : 1px solid teal;
       width : 100%;
       height : 15%;
       display : flex;
       justify-content: space-around;
       align-items: center;
    }

    #content-area{

       border : 1px solid teal;
        height : 75%; 
        width : 100%;
    }

</style>

  </head>
  <body>
 	<jsp:include page="../common/header.jsp" />
 	
    <div id="wrapper">
			
        <section id="search-area">

            <article id="search-condition">
          	 	 <form action="search.condition" method="GET">
					<select name="condition">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="userId">글쓴이</option>
					</select>
	                <input type="text" name="keyword" placeholder="검색어를 입력하세요"/>
					<button id="search-keyword-btn" type="submit"><i class="fas fa-search fa-lg"></i></button>
				</form>
            </article>

            <article id="search-status">
            	<form action="search.status">
	            	<select name="status">
	            		<option value="coming">진행예정</option>
	            		<option value="progress">진행중</option>
	            		<option value="complete">종료</option>
	            	</select>
	            </form>
            </article>
        
        </section>
<!-- search -->
<style>
	#search-condition{
	}
	
	#search-keyword{
	}
	
	#search-keyword-btn{
		border: 0;
 	    background-color: transparent;
 	    border :  1px solid black;
	}
	
	
	#search-status{
	}
	

</style>

	<section id="content-area">
		<article id="content-items">
			<c:forEach var="challenge" items="${ list }">
		
				<div class="content-item">
					<div>
						<span>${ challenge.userNo }</span>
						<span>${ challenge.viewCount }</span>
						<span>${ challenge.likeCount }</span>
					</div>
					<a><img src="data:image/jpeg;base64,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"/></a>
					<h6>${ challenge.challengeTitle }</h6>
					<div>
						<span>${ challenge.categoryName }</span>
						<span>${ challenge.successLimit }</span>
						<span>${ challenge.startDate }</span>
					</div>
				</div>
			
			</c:forEach>
		</article>
	</section>


<!-- content  -->
<style>
	#content-items{
      	display : grid;
      	justify-content : center;
        grid-template-columns : 400px 400px;
        grid-row: auto auto;
        
      grid-column-gap: 100px;
  		grid-row-gap: 50px;
        
    
	}
	.content-item{

	    align-items:center;
	    justify-content:center; 

	}
	.content-item img{
		width : 400px;
		height : 250px;
	}
</style>


	<section id="pasing-area">
	
	
	
	</section>



	</div>

</body>
</html>



