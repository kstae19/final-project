<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>독후감 게시판 글작성/수정</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        /* 겉을 감싸는 div */
        .outer{
            margin: auto;
            width: 1200px;
            overflow:visible;
        }

        .outer button{
            float: right;
            margin-left: 10px;
        }
        .outer textarea{
            height: 500px;
            width: 100%;
            resize: none;
        }
        .outer input[type='text']{
            height: 35px;
            width: 100%;
        }
    </style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	<jsp:include page="../common/bookHeader.jsp" />
	<jsp:include page="../common/bookLeftBanner.jsp" />

    <div class="outer">
        <h3>글쓰기</h3>
	        <form method="POST" action="reportEnrollForm.bk">
	        	<input type="hidden" name="userNo" value="${ loginUser.userNo }">
	        	<input type="hidden" name="bookReportNo" value="0">
		        <label><input type="checkbox" name="bookReportSecret" value="1">비밀글</label>
		        <c:if test="${ loginUser.userStatus eq 'A' }">
		        	<label><input type="checkbox" name="bookReportNotice" value="1">공지등록</label>
		        </c:if>
		        <input type="text" placeholder="제목을 입력해 주세요." name="bookReportTitle" maxlength="30">
		        <br><br>
		        <textarea placeholder="내용을 입력해주세요." name="bookReportContent" maxlength="1300"></textarea>
		        <br><br>
		        <span>별점</span>
		        <select name="bookReportStar">
		         <c:if test="${ loginUser.userStatus eq 'A' }">
		         	<option value="0">공지</option>
		         </c:if>
		        	<option value="1">★</option>
		        	<option value="2">★★</option>
		        	<option value="3">★★★</option>
		        	<option value="4">★★★★</option>
		        	<option value="5">★★★★★</option>
		        </select>
		        <button type="submit" class="btn btn-secondary">등록</button>
		        <button type="button" class="btn btn-dark" onclick="location.href='bookReport'">취소</button>
	    	</form>
    </div>
    
    <c:if test="${ not empty br }">
    	<script>
    		// 체크목적으로 만든 함수
    		function Check(str){
    			if(str != '1'){
    				return false;
    			}
    			else{
    				return true;
    			}
    		}
    		
    		$(function(){
    			$('input[name=bookReportSecret]').attr("checked", Check('${br.bookReportSecret}'));
    			$('input[name=bookReportNotice]').attr("checked", Check('${br.bookReportNotice}'));
    			$('input[name=bookReportTitle]').val('${br.bookReportTitle}');
    			$('textarea[name=bookReportContent]').val('${br.bookReportContent}');
    			$('option[value=${br.bookReportStar}]').attr("selected", true);
    			$('input[name=bookReportNo]').val('${br.bookReportNo}');
    			
    			$('form').attr("action", "reportUpdateForm.bk");
    		})
    	</script>
    </c:if>
    
</body>
</html>