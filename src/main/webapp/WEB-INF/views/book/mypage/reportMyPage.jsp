<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>독후감 마이페이지</title>
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
    </style>
    <script>
    	function selectMyPageReport(nowPage){
    		$.ajax({
    			url : 'reportmypage.bk',
    			async : false,
    			type : 'post',
    			data : {
    				userNo : '${ loginUser.userNo }',
					bPage : nowPage    				
    			},
    			success : result => {
    				console.log(result);
    				
    				/*let book = result.bookList;
					let bookPi = result.bookPi;
    				if(book.size){
    					$('#book-mypage').html("북마크한 도서가 없습니다.");
    				} else {
    					let buttonBefore = $('#book-mypage').children().first();
    					let buttonNext = $('#book-mypage').children().last();
    					
        				let bookValue = '';
        				for(let i in book){
        					bookValue += '<div>'
        							   + '<img src="' + book[i].bookImg + '">'
        							   + '<p>' + book[i].bookTitle + '</p>'
        							   + '</div>';
        				}
        				$('#mypage-book').html(bookValue);
        				
        				if(bookPi.currentPage == 1){
        					$(buttonBefore).attr("disabled", true);
        				} else{
        					$(buttonBefore).attr("disabled", false);
        					$(buttonBefore).attr("onclick", "selectMyPageBook(" + (bookPi.currentPage -1) +")");
        				}
        				if(book.length < bookPi.boardLimit){
        					$(buttonNext).attr("disabled", true);
        				} else{
        					$(buttonNext).attr("disabled", false);
        					$(buttonNext).attr("onclick", "selectMyPageBook(" + (bookPi.currentPage + 1) +")");
        				}
    				}*/
    			},
   				error : function(){
   					console.log("통신 실패");
   				}
    		})
    	}
    	
    	function selectMyPageReply(nowPage){
			$.ajax({
				url : 'reportreplymypage.bk',
    			async : false,
    			type : 'post',
    			data : {
    				userNo : '${ loginUser.userNo }',
					rPage : nowPage    				
    			},
    			success : result => {
    				console.log(result);
    				/*
    				let reply = result.replyList;
					let replyPi = result.replyPi;
    				if(reply.size){
    					$('#bookReply-area').html("작성한 한줄평이 없습니다.");
    				} else {
        				let replyValue = '';
        				for(let i in reply){
        					replyValue += '<tr>'
        								+ '<td>'
        								+ '<img src="' + reply[i].bookImg + '"></td>'
        								+ '<td>' + reply[i].bookTitle + '</td>'
        								+ '<td>' + reply[i].bookReply + '</td>'
        								+ '</tr>';
        				}
        				$('#mypagebookreply').html(replyValue);
        				
        				let replyPiValue = '';
        				if(replyPi.currentPage == 1){
        					replyPiValue += '<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>';
        				} else{
        					replyPiValue += '<li class="page-item"><a class="page-link" onclick="selectBookReply('+ replyPi['currentPage'] - 1 +');">Previous</a></li>';
        				}
        				for(let i = replyPi.startPage; i <= replyPi.endPage; i++){
        					replyPiValue += '<li class="page-item"><a class="page-link" onclick="selectBookReply(' + i + ');">' + i + '</a></li>';
        				}
        				if(replyPi.currentPage == replyPi.endPage){
        					replyPiValue += '<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>';
        				} else{
        					replyPiValue += '<li class="page-item"><a class="page-link" onclick="selectBookReply('+ replyPi['currentPage'] + 1 +');">Next</a></li>';
        				}
        				
        				$('#mypagebookReply').html(replyPiValue);
    				}*/
        				
        				
    			},
				error : function(){
					console.log("통신 실패");
				}
    		})
    	}
    
    	$(function(){
    		selectMyPageReport();
    		selectMyPageReply();
    	})
    </script>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	<jsp:include page="../common/bookHeader.jsp" />
	<jsp:include page="../common/myPageLeftBanner.jsp" />

    <div class="outer">
        <h3>게시글 목록</h3>
        <table class="table table-bordered">
            <thead>
              <tr>
                <th>게시판번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>조회수</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>★★★★★ 제목</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
              </tr>
              <tr>
                <td>1</td>
                <td>★★★★★ [비밀글] 제목</td>
                <td>mary@example.com</td>
                <td>1</td>
              </tr>
              <tr>
                <td>1</td>
                <td>★★★★★ 제목 [댓글수]</td>
                <td>july@example.com</td>
                <td>1</td>
              </tr>
            </tbody>
          </table>
          <ul class="pagination justify-content-center">
            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
          </ul>
          <br><br>

          <h3>댓글 목록</h3>
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>작성일</th>
                <th>댓글</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>댓글</td>
              </tr>
              <tr>
                <td>1</td>
                <td>댓글</td>
              </tr>
              <tr>
                <td>1</td>
                <td>댓글</td>
              </tr>
            </tbody>
          </table>
          <ul class="pagination justify-content-center">
            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
          </ul>
    </div>
 
</body>
</html>