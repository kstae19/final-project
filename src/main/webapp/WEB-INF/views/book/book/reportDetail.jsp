<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>독후감 게시판 상세조회</title>
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

        .outer>button{
            float: right;
            margin-left: 10px;
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
	
	function selectReportReply(nowPage){
		// 댓글 조회 ajax
		$.ajax({
			url : 'selectreportreply.bk',
			async : false,
			type : 'post',
			data : {
				reportNo : '${ br.bookReportNo }',
				cPage : nowPage    				
			},
			success : result => {
				console.log(result);
				
				$('#reportReply-count').html(result.replyCount);
				if(result.replyCount == 0){
					$('#reportReply-area').html("댓글이 없습니다.");
				} else {
					let replyArr = result.replyList;
    				let replyValue = '';
    				for(let i in replyArr){
    					replyValue += '<div>'
    					if(!isEmpty('${ sessionScope.loginUser.userId }')){
    						if(replyArr[i].userId === '${ sessionScope.loginUser.userId }'){
        						replyValue += '<button type="button" class="btn btn-secondary" onclick="deleteReportReply(this);">삭제</button>';
        						replyValue += '<button type="button" class="btn btn-secondary" onclick="update(this);">수정</button>';
    						}
    						replyValue += '<button type="button" class="btn btn-dark" onclick="reportReplyBlack(this);">신고하기</button>'
    					}
    				replyValue += '<p style="margin-bottom: 0px;">' + replyArr[i].userId  + '</p>'
    						   + '<p style="margin-bottom: 0px;">' + replyArr[i].bookReportReplyDate + '</p>'
    						   + '<p class="replyContent">' + replyArr[i].bookReportReplyContent + '</p>'
    						   + '<input type="hidden" value="' + replyArr[i].bookReportReplyNo +'">'
    						   + '</div>';
    				}
    				$('#reportReply-area').html(replyValue);
    				
    				let replyPi = result.replyPi;
    				let replyPiValue = '';
    				if(replyPi['currentPage'] == 1){
    					replyPiValue += '<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>';
    				} else{
    					replyPiValue += '<li class="page-item"><a class="page-link" onclick="selectBookReply('+ replyPi['currentPage'] - 1 +');">Previous</a></li>';
    				}
    				for(let i = replyPi.startPage; i <= replyPi.endPage; i++){
    					replyPiValue += '<li class="page-item"><a class="page-link" onclick="selectBookReply(' + i + ');">' + i + '</a></li>';
    				}
    				if(replyPi['currentPage'] == replyPi['endPage']){
    					replyPiValue += '<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>';
    				} else{
    					replyPiValue += '<li class="page-item"><a class="page-link" onclick="selectBookReply('+ replyPi['currentPage'] + 1 +');">Next</a></li>';
    				}
    				
    				$('#reportReply-pagination').html(replyPiValue);
				}
				},
				error : () => {
					console.log("댓글 통신 실패");
				}
			});
		}
		
		$(function(){
			selectReportReply();
		})
		
		function insertReportReply(){ // 댓글 등록 ajax
			
       		if($('#reportReplyContent').val().trim() != ''){
   	    		$.ajax({
   	    			url : 'insertreportreply.bk',
   	    			type : 'post',
   	    			data : {
   	    				reportNo : '${ br.bookReportNo }',
   	    				userNo : '${ loginUser.userNo }',
   	    				content : $('#reportReplyContent').val()
   	    			},
   	    			success : result => {
   	    				console.log(result);
   	    				
   	    				if(result === 'success'){
   	    					$('#reportReplyContent').val('');
   	    					selectReportReply();
   	    				} else{
   	    					alert('댓글 등록 실패');
   	    				}
   	    			},
   	    			error : () => {
   	    				console.log("댓글 통신 실패");
   	    			}
   	    		});
       		}
       	}
		
		function updateReportReply(e){// 댓글 수정 ajax
			if($('#reportReplyContent').val().trim() != ''){
	    		$.ajax({
	    			url : 'updatereportreply.bk',
	    			async : false,
	    			type : 'post',
	    			data : {
	    				replyNo : $(e).next().next().next().next().next().val(),
	    				content : $(e).next().next().next().next().val()
	    			},
	    			success : result => {
	    				console.log(result);
	    				
	    				if(result === 'success'){
	    					selectReportReply();
	    				} else{
	    					alert('댓글 수정 실패');
	    				}
	    			},
	    			error : () => {
	    				console.log("댓글 통신 실패");
	    			}
	    		});
    		}
		}
		
		function update(e){ 
			
			let replyContent = $(e).next().next().next().next();
			let content = $(e).next().next().next().next().text();
			
			replyContent.after('<input type="text" id="reportReplyContent" value="'+ content + '">');
			replyContent.remove();
			$(e).attr("onclick", "updateReportReply(this);");
    	}
	    		
   		function deleteReportReply(e){ // 댓글 삭제 ajax
       		$.ajax({
       			url : 'deletereportreply.bk',
       			async : false,
       			type : 'post',
       			data : {
       				replyNo : $(e).next().next().next().next().next().next().val(),
       				userNo : '${ loginUser.userNo }'
       			},
       			success : result => {
       				console.log(result);
       				
       				if(result === 'success'){
       					selectReportReply();
  	    				} else{
  	    					alert('댓글 삭제 실패');
  	    				}
       			},
       			error : () => {
       				console.log("댓글 통신 실패");
       			}
       		})
       	}
   		
   		function reportReplyBlack(e){ // 댓글 신고 ajax
       		$.ajax({
       			url : 'reportReplyBlack.bk',
       			async : false,
       			type : 'post',
       			data : {
       				reportReplyNo : $(e).next().next().next().next().val(),
       				blackId : $(e).next().text(),
					userNo : '${ loginUser.userNo }'
       			},
       			success : result => {
       				console.log(result);
       				
       				if(result === 'success'){
       					alert('신고 완료');
       					selectReportReply();
  	    				} else{
  	    					alert('댓글 신고 실패');
  	    				}
       			},
       			error : () => {
       				console.log("댓글 통신 실패");
       				console.log($(e).next().next().next().next().val());
       				console.log($(e).next().text());
       				console.log('${ loginUser.userNo }');
       			}
       		})
       	}
    </script>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	<jsp:include page="../common/bookHeader.jsp" />
	<jsp:include page="../common/bookLeftBanner.jsp" />

    <div class="outer">
        <button type="button" class="btn btn-secondary" onclick="location.href='bookreport'">목록</button>
        <hr>

        <h3>
			 <c:forEach var="i" begin="1" end="${ br.bookReportStar }">
         		★
         	</c:forEach>
			${ br.bookReportTitle }
		</h3>
		<!-- 폼태그 post로 바꿔야할듯... -->
        <p style="margin-bottom: 0px;">${ br.userId }</p>
        <span>${ br.bookReportDate }</span>
        <c:if test="${ not empty sessionScope.loginUser }">
	        <button type="button" class="btn btn-dark" onclick="location.href='reportBlack.bk?reportNo=${br.bookReportNo}&userId=${ br.userId }&userNo=${ loginUser.userNo }'">신고하기</button>
	        <c:if test="${ loginUser.userId eq br.userId }">
		        <button type="button" class="btn btn-danger" onclick="location.href='reportDelete.bk?reportNo=${br.bookReportNo}'">삭제</button>
		        <button type="button" class="btn btn-secondary" onclick="location.href='reportUpdate.bk?reportNo=${br.bookReportNo}'">수정</button>
	        </c:if>
        </c:if>
        <hr>
        <p>
        	${ br.bookReportContent }
        </p>
        <hr>

        <div>
            <div>
                <span>댓글</span>
                <span id="reportReply-count"></span>
            </div>
            <br>
            <div id="reportReply-area">
            </div>
            <ul class="pagination justify-content-center" id="reportReply-pagination">
            </ul>
            <input type="text" placeholder="댓글을 남겨보세요" style="height: 50px; width: 90%;" id="reportReplyContent">
            <c:if test="${ not empty loginUser }">
	            <button type="submit" class="btn btn-secondary" style="height: 50px; width: 9%;" onclick="insertReportReply();">등록</button>
	            <p>0/50</p>
            </c:if>
        </div>




    </div>

</body>
</html>