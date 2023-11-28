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
        height: 1200px; 
       margin: auto;
        background-color: white;
    }

    #content-area{

       border : 1px solid teal;
        height : 75%; 
        width : 100%;
    }
    input {

		-webkit-appearance : none;
		
		-moz-appearance:none;
		
		appearance:none;

		border:none;
	
	}
    
    select {

		-webkit-appearance: none;
		
		-moz-appearance:none;
		
		appearance:none;
		
		border:none;
	
	}

</style>

  </head>
  <body>
 	<jsp:include page="../common/header.jsp" />
 	
    <div id="wrapper">
    
	<section id="content-area">
        <br>
        <h2 align="center">게시글 작성</h2>
        <br><br>


		<!--파일을 첨부하는 요청을 할 때는 반드시 form태그에 enctype="multipart/form-data" 를 추가해줘야함!!-->
        <form enctype="multipart/form-data" action="insert.ch" id="enrollform" method="post">
			<input type="hidden" name="user" value="${loginUser.userNo }" />
            <article id="content-items">
            	<div class="content-item">
	            	<label for="title">
							챌린지명<input id="title" type="text" name="challengeTitle">
					</label>
            	</div>
            	 	<div class="content-item">
	            	<select id="category" name="categoryNo">
	            			<option selected>카테고리</option>
							<option value="1">비건</option>
							<option value="2">친환경제품사용</option>
							<option value="3">에너지절약</option>
							<option value="4">교육</option>
							<option value="5">기타</option>
					</select>
            	</div>
            	 	<div class="content-item">
	            	<label for="place" >
							장소<input id="place" type="text" name="challengePlace"/><i class="fas fa-map-marker-alt"></i>
							<!-- 지도api에서 위치 클릭시 해당 도로명주소를 String으로 받아와 ajax로 input의 value값에 세팅할 예정 -->
					</label>
            	</div>
            	 	<div class="content-item">
	            	<label for="startDate">
							시작일<input id="startDate" type="date" value="2023-11-11" name="startDate">
					</label>
            	</div>
            	 	<div class="content-item">
	            	<label for="endDate">
							종료일<input id="endDate" type="date" value="2023-11-11" name="endDate">
					</label>
            	</div>
            	<div class="content-item">
					 <select id="achievementCount" name="achievementCount">
	            			<option value="everyday">매일</option>
							<option value="everyweek">매주<option>
					</select>
            	</div>
          	     <div class="content-item">
	            	<label for="successLimit">
							목표달성률<input id="successLimit" type="number" min="0" max="100" name="successLimit">
					</label>
            	</div>
        	     <div class="content-item">
	            	<label for="minParticipant">
							최소인원<input id="minParticipant" type="number" min="0" max="100" name="minParticipant">
					</label>
            	</div>
            	<div class="content-item">
	            	<label for="maxParticipant">
							최대인원<input id="maxParticipant" type="number" min="0" max="100" name="maxParticipant">
					</label>
            	</div>
            	 <div class="content-item">
	            	<label for="file" id="file">
							File🖼️<input id="upfile" type="file" name="upfile"/><!-- fileInput의 name을 multiFileRequest의 이름과 맞춰야  -->
					</label>
            	</div>
                <div class="content-item">
							내용
				<textarea id="content"  style="resize:none; height:300px;" name="challengeContent">
				</textarea>
            	</div>

            </article>
            
            
            <br><br>
            <script>
              
            </script>
            
            <div align="center">
                <button type="submit" id="insert-btn" class="btn btn-sm btn-info">글작성</button>
            </div>
   
        </form>
		<br><br><br>
	</section>
        <style>
            #content-items{
                width : 100%;
                display : flex;
                flex-flow : column nowrap;
                justify-content : center;
                align-items : center;
            }
            .content-item{
				width : 30%;
				height : 5%;
				border : 1px solid black;
				text-align : center;
				
            }
            .content-item-title{
                width : 10%;
                
            }
            .content-item-content{
                width : 70%;
                
                
            }
            #ctg{
                width : 100%;
            }
            #title{
                width : 100%;
            }
            #content{
                width : 100%;
            }
           	#upfile {
              /*   position: absolute;
                width: 0;
                height: 0;
                padding: 0;
                overflow: hidden;
                border: 0; */
                
            }
            #file {
                color : black;
                background-color: rgb(247, 189, 96);
                width : 60px;
                height : 30px;
                
                display: flex;
                justify-content: center;
                align-items: center;
                border-radius: 10px;
          
            }
            #insert-btn{
                background-color: burlywood;
            }
        </style>

    
  </div>
</body>
</html>