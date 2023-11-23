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
    				let report = result.reportList;
					let reportPi = result.reportPi;
    				if(report.size){
    					$('#mypagereport').html("북마크한 도서가 없습니다.");
    				} else {
        				let reportValue = '';
        				for(let i in report){
        					reportValue += '<tr>'
        								 + '<td>' + report[i].bookReportNo + '</td>'
        								 + '<td>' + report[i].bookReportTitle + '</td>'
        								 + '<td>' + report[i].bookReportDate + '</td>'
        								 + '<td>' + report[i].bookReportCount + '</td>'
        								 + '</tr>';
        				}
        				$('#mypagereport').html(reportValue);
        				
        				let reportPiValue = '';
        				if(reportPi.currentPage == 1){
        					reportPiValue += '<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>';
        				} else{
        					reportPiValue += '<li class="page-item"><a class="page-link" onclick="selectMyPageReport('+ reportPi['currentPage'] - 1 +');">Previous</a></li>';
        				}
        				for(let i = reportPi.startPage; i <= reportPi.endPage; i++){
        					reportPiValue += '<li class="page-item"><a class="page-link" onclick="selectMyPageReport(' + i + ');">' + i + '</a></li>';
        				}
        				if(reportPi.currentPage == reportPi.endPage){
        					reportPiValue += '<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>';
        				} else{
        					reportPiValue += '<li class="page-item"><a class="page-link" onclick="selectMyPageReport('+ reportPi['currentPage'] + 1 +');">Next</a></li>';
        				}
        				
        				$('#bookreportmypagepagination').html(reportPiValue);
    				}
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
    				
    				let reply = result.replyList;
					let replyPi = result.replyPi;
					
    				if(reply.size){
    					$('#bookreportmypagereply').html("작성한 한줄평이 없습니다.");
    				} else {
        				let replyValue = '';
        				for(let i in reply){
        					replyValue += '<tr>'
        								+ '<td>' + reply[i].bookReportReplyDate + '</td>'
        								+ '<td>' + reply[i].bookReportReplyContent + '</td>'
        								+ '</tr>';
        				}
        				$('#bookreportmypagereply').html(replyValue);
        				
        				let replyPiValue = '';
        				if(replyPi.currentPage == 1){
        					replyPiValue += '<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>';
        				} else{
        					replyPiValue += '<li class="page-item"><a class="page-link" onclick="selectMyPageReply('+ replyPi['currentPage'] - 1 +');">Previous</a></li>';
        				}
        				for(let i = replyPi.startPage; i <= replyPi.endPage; i++){
        					replyPiValue += '<li class="page-item"><a class="page-link" onclick="selectMyPageReply(' + i + ');">' + i + '</a></li>';
        				}
        				if(replyPi.currentPage == replyPi.endPage){
        					replyPiValue += '<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>';
        				} else{
        					replyPiValue += '<li class="page-item"><a class="page-link" onclick="selectMyPageReply('+ replyPi['currentPage'] + 1 +');">Next</a></li>';
        				}
        				
        				$('#bookreportmypagereplypaginagion').html(replyPiValue);
    				}
        				
        				
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
            <tbody id="mypagereport">
              
            </tbody>
          </table>
          <ul class="pagination justify-content-center" id="bookreportmypagepagination">
            
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
            <tbody id="bookreportmypagereply">
              
            </tbody>
          </table>
          <ul class="pagination justify-content-center" id="bookreportmypagereplypaginagion">
            
          </ul>
    </div>
 
</body>
</html>