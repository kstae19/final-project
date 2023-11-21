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
	
	function selectBookReply(nowPage){
		// 댓글 조회 ajax
		$.ajax({
			url : 'selectbookreply.bk',
			async : false,
			type : 'get',
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
    					if(!isEmpty('${ sessionScope.loginUser.userId }')){
    						if(replyArr[i].userId === '${ sessionScope.loginUser.userId }'){
        						replyValue += '<button type="button" class="btn btn-secondary" onclick="deleteReply();">삭제</button>';
        					}
    					}
    					replyValue += '<p style="margin-bottom: 0px;">' + replyArr[i].userId  + '</p>'
    						   + '<p style="margin-bottom: 0px;">' + replyArr[i].reportReplyDate + '</p>'
    						   + '<p>' + replyArr[i].bookReplyContent + '</p>';
    				}
    				$('#bookReply-area').html(replyValue);
    				
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
    				
    				$('#bookReply-pagination').html(replyPiValue);
				}
				},
				error : () => {
					console.log("댓글 통신 실패");
				}
			});
		}
		
		$(function(){
			selectBookReply();
		})
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
                <p style="margin-bottom: 0px;">아이디</p>
                <p style="margin-bottom: 0px;">작성날짜</p>
                <p>리뷰글행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도</p>
            </div>
            <ul class="pagination justify-content-center">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
            <input type="text" placeholder="댓글을 남겨보세요" name="" style="height: 50px; width: 90%;">
            <button type="submit" class="btn btn-secondary" style="height: 50px; width: 9%;">등록</button>
            <p>0/50</p>
        </div>




    </div>

</body>
</html>