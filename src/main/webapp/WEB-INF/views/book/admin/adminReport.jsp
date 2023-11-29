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
    
	  //문자열이 빈 문자열인지 체크하여 결과값을 리턴. 
		function isEmpty(str){
			if(typeof str == "undefined" || str == null || str == "")
				return true;
			else
				return false ;
		}
	  
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
	                
					let reportBlack = result.list;
					let reportBlackPi = result.pi;
					if(isEmpty(reportBlack)){
						$('#reportBlack').html("신고된 게시글이 없습니다.");
					} else {
	    				let reportBlackValue = '';
	    				for(let i in reportBlack){
	    					let star = '★'.repeat(reportBlack[i].reportStar);
	    					
	    					reportBlackValue += '<tr>'
	    									 + '<td><input type="checkbox" class="reportCheckbox"></td>'
		    								 + '<td>' + reportBlack[i].reportNo + '</td>'
		    								 + '<td>' + reportBlack[i].userId + '</td>'
		    								 + '<td>' 
		    								 + star + " "
		    								 + reportBlack[i].reportTitle 
		    								 + '</td>'
		    								 + '<td>' + reportBlack[i].reportDate + '</td>'
		    								 + '</tr>';
	    				}
	    				$('#reportBlack').html(reportBlackValue);
	    				
	    				
	    				let reportBlackPiValue = '';
	    				let previous = reportBlackPi.currentPage - 1;
	    				let next = reportBlackPi.currentPage + 1;
	    				if(reportBlackPi.currentPage == 1){
	    					reportBlackPiValue += '<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>';
	    				} else{
	    					reportBlackPiValue += '<li class="page-item"><a class="page-link" onclick="reportBlack('+ previous +');">Previous</a></li>';
	    				}
	    				for(let i = reportBlackPi.startPage; i <= reportBlackPi.endPage; i++){
	    					reportBlackPiValue += '<li class="page-item"><a class="page-link" onclick="reportBlack(' + i + ');">' + i + '</a></li>';
	    				}
	    				if(reportBlackPi.currentPage == reportBlackPi.endPage){
	    					reportBlackPiValue += '<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>';
	    				} else{
	    					reportBlackPiValue += '<li class="page-item"><a class="page-link" onclick="reportBlack('+ next +');">Next</a></li>';
	    				}
	    				
	    				$('#reportBlackPi').html(reportBlackPiValue);
	    				
					}
				},
					error : function(){
						console.log("통신 실패");
					}
			})
		}
		
		function reportReplyBlack(nowPage){
			$.ajax({
				url : 'adminReportReplyBlack.bk',
				async : false,
				type : 'post',
				data : {
					cPage : nowPage    				
				},
				success : result => {
					console.log(result);
					
					let replyBlack = result.list;
					let replyBlackPi = result.pi;
					if(isEmpty(replyBlack)){
						$('#replyBlack').html("신고된 댓글이 없습니다.");
					} else {
	    				let replyBlackValue = '';
	    				for(let i in replyBlack){
	    					replyBlackValue += '<tr>'
	    									 + '<td><input type="checkbox" class="replyCheckbox"></td>'
	    									 + '<td>' + replyBlack[i].replyBlackNo + '</td>'
		    								 + '<td>' + replyBlack[i].replyDate + '</td>'
		    								 + '<td>' + replyBlack[i].userId + '</td>'
		    								 + '<td>' + replyBlack[i].replyContent + '</td>'
		    								 + '</tr>';
	    				}
	    				$('#replyBlack').html(replyBlackValue);
	    				
	    				
	    				let replyBlackPiValue = '';
	    				let previous = replyBlackPi.currentPage - 1;
	    				let next = replyBlackPi.currentPage + 1;
	    				if(replyBlackPi.currentPage == 1){
	    					replyBlackPiValue += '<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>';
	    				} else{
	    					replyBlackPiValue += '<li class="page-item"><a class="page-link" onclick="reportBlack('+ previous +');">Previous</a></li>';
	    				}
	    				for(let i = replyBlackPi.startPage; i <= replyBlackPi.endPage; i++){
	    					replyBlackPiValue += '<li class="page-item"><a class="page-link" onclick="reportBlack(' + i + ');">' + i + '</a></li>';
	    				}
	    				if(replyBlackPi.currentPage == replyBlackPi.endPage){
	    					replyBlackPiValue += '<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>';
	    				} else{
	    					replyBlackPiValue += '<li class="page-item"><a class="page-link" onclick="reportBlack('+ next +');">Next</a></li>';
	    				}
	    				
	    				$('#replyBlackPi').html(replyBlackPiValue);
					}
				},
				error : function(){
					console.log("통신 실패");
				}
			})
		}
		
		function deleteReportBlack(){
			if($('.reportCheckbox:checked').length > 0){
				if(confirm("삭제하시겠습니까? 취소할 수 없습니다.")){
					let blackNoArr = [];
					
					$.each($('.reportCheckbox:checked'), function(i){
						let blackReportNo = $('.reportCheckbox:checked').parent().parent().eq(i).children().eq(1).text();
						
						blackNoArr.push(blackReportNo);
					})
					
		       		$.ajax({
		       			url : 'deleteReportBlack.bk',
		       			async : false,
		       			type : 'post',
		       			data : {
		       				blackReportNoArr : blackNoArr
		       			},
		       			traditional: true,
		       			success : result => {
		       				console.log(result);
		       				
		       				if(result === 'success'){
		       					alert('삭제 성공');
		       					reportBlack();
		  	    				} else{
		  	    					alert('삭제 실패');
		  	    				}
		       			},
		       			error : () => {
		       				console.log("게시글 통신 실패");
		       			}
		       		})
				}else{
					return;
				}
			}
		}
		
		function deleteReplyBlack(){
			if(confirm("삭제하시겠습니까? 취소할 수 없습니다.")){
				let blackNoArr = [];
				
				$.each($('.replyCheckbox:checked'), function(i){
					let blackReplyNo = $('.replyCheckbox:checked').parent().parent().eq(i).children().eq(1).text();
					
					blackNoArr.push(blackReplyNo);
				})
				
	       		$.ajax({
	       			url : 'deleteReplyBlack.bk',
	       			async : false,
	       			type : 'post',
	       			data : {
	       				blackReplyNoArr : blackNoArr
	       			},
	       			traditional: true,
	       			success : result => {
	       				console.log(result);
	       				
	       				if(result === 'success'){
	       					alert('삭제 성공');
	       					reportReplyBlack();
	  	    				} else{
	  	    					alert('삭제 실패');
	  	    				}
	       			},
	       			error : () => {
	       				console.log("댓글 통신 실패");
	       			}
	       		})
			}else{
				return;
			}
		}
		
	
		$(function(){
			reportBlack();
			reportReplyBlack();
		})
    </script>
</head>
<body>
	
	<jsp:include page="../../common/header.jsp" />
	<jsp:include page="../common/bookHeader.jsp" />
	<jsp:include page="../common/bookLeftBanner.jsp" />
	
    <div class="outer">
        <h3>신고 게시글 목록</h3>
        <button type="button" class="btn btn-secondary" onclick="deleteReportBlack();">게시글삭제</button>
        <table class="table table-bordered">
            <thead>
              <tr>
                <th><input type="checkbox" id="reportCheckAll"></th>
                <th>게시판번호</th>
                <th>아이디</th>
                <th>제목</th>
                <th>작성일</th>
              </tr>
            </thead>
            <tbody id="reportBlack">
              
            </tbody>
          </table>
          <ul class="pagination justify-content-center" id="reportBlackPi">
          
          </ul>
          <br><br>

          <h3>댓글 목록</h3>
          <button type="button" class="btn btn-secondary" onclick="deleteReplyBlack();">댓글삭제</button>
          <table class="table table-bordered">
            <thead>
              <tr>
                <th><input type="checkbox" id="replyCheckAll"></th>
                <th>댓글번호</th>
                <th>작성일</th>
                <th>작성자</th>
                <th>댓글</th>
              </tr>
            </thead>
            <tbody id="replyBlack">
              
            </tbody>
          </table>
          <ul class="pagination justify-content-center" id="replyBlackPi">
            <!-- <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li> -->
          </ul>
    </div>
    <script>
	    $('#reportCheckAll').click(function(){
			if($(this).is(":checked")){
				$(".reportCheckbox").prop("checked", true);
			} else{
				$(".reportCheckbox").prop("checked", false);
			}
		})
		$(document).on("change", ".reportCheckbox", function(){
			let reportCheckLength = $('.reportCheckbox').length;
			let reportCheckedLength = $(".reportCheckbox:checked").length;
			
			if(reportCheckLength == reportCheckedLength){ // 전체체크
				$('#reportCheckAll').attr("checked", true);
			}else{ // 하나라도 체크해제
				$('#reportCheckAll').attr("checked", false);
			}
		})
    
    	$('#replyCheckAll').on("click", function(){
    		if($('.replyCheckbox').length != 0){
    			if($(this).is(":checked")){
        			$(".replyCheckbox").prop("checked", true);
        		} else{
        			$(".replyCheckbox").prop("checked", false);
        		}
    		}else{
    			$(this).attr("checked", false);
    		}
    		
    	})
    	$(document).on("change", ".replyCheckbox", function(){
    		let replyCheckLength = $('.replyCheckbox').length;
    		let replyCheckedLength = $(".replyCheckbox:checked").length;
    		
    		if(replyCheckLength == replyCheckedLength){ // 전체체크
    			$('#replyCheckAll').attr("checked", true);
    		}else{ // 하나라도 체크해제
    			$('#replyCheckAll').attr("checked", false);
    		}
    	})
    </script>
    <br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>
</html>