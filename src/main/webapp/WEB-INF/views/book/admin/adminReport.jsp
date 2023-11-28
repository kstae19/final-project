<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>독후감 게시판 신고</title>
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
	    function reportBlack(nowPage){
			$.ajax({
				url : 'adminReportBlack.bk',
				async : false,
				type : 'post',
				data : {
					cPage : nowPage    				
				},
				success : result => {
					console.log(result);
					
					/*
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
	    				
					}*/
				},
					error : function(){
						console.log("통신 실패");
					}
			})
		}
		
		function reportReplyBlack(nowPage){
			$.ajax({
				url : 'adminReportreplymypage.bk',
				async : false,
				type : 'post',
				data : {
					rPage : nowPage    				
				},
				success : result => {
					console.log(result);
					
					/*
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
					*/
	    				
	    				
				},
				error : function(){
					console.log("통신 실패");
				}
			})
		}
	
		$(function(){
			reportBlack();
			//reportReplyBlack();
		})
    </script>
</head>
<body>
	
	<jsp:include page="../../common/header.jsp" />
	<jsp:include page="../common/bookHeader.jsp" />
	<jsp:include page="../common/bookLeftBanner.jsp" />
	
    <div class="outer">
        <h3>신고 게시글 목록</h3>
        <button type="button" class="btn btn-secondary">게시글삭제</button>
        <button type="button" class="btn btn-secondary">목록에서 삭제</button>
        <button type="button" class="btn btn-dark">블랙리스트 추가</button>
        <table class="table table-bordered">
            <thead>
              <tr>
                <th><input type="checkbox"></th>
                <th>게시판번호</th>
                <th>아이디</th>
                <th>제목</th>
                <th>작성일</th>
                <th>삭제여부</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><input type="checkbox"></td>
                <td>★★★★★ 제목</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
              </tr>
              <tr>
                <td><input type="checkbox"></td>
                <td>★★★★★ 제목</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
              </tr>
              <tr>
                <td><input type="checkbox"></td>
                <td>★★★★★ 제목</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
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
          <button type="button" class="btn btn-secondary">댓글삭제</button>
          <button type="button" class="btn btn-dark">블랙리스트 추가</button>
          <table class="table table-bordered">
            <thead>
              <tr>
                <th><input type="checkbox"></th>
                <th>작성일</th>
                <th>작성자</th>
                <th>댓글</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><input type="checkbox"></td>
                <td>댓글</td>
                <td>댓글</td>
                <td>댓글</td>
              </tr>
              <tr>
                <td><input type="checkbox"></td>
                <td>댓글</td>
                <td>댓글</td>
                <td>댓글</td>
              </tr>
              <tr>
                <td><input type="checkbox"></td>
                <td>댓글</td>
                <td>댓글</td>
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