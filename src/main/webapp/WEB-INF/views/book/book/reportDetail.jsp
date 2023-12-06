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
			url : 'selectReportReply.bk',
			type : 'post',
			data : {
				reportNo : '${ br.bookReportNo }',
				cPage : nowPage    				
			},
			success : result => {
				
				$('#reportReply-count').html(result.replyCount);
				if(result.replyCount == 0){
					$('#reportReply-area').html("댓글이 없습니다.");
					$('#reportReply-pagination').html('');
				} else {
					let replyArr = result.replyList;
    				let replyValue = '';
    				let replyPi = result.replyPi;
    				let replyPiValue = '';
    				for(let i in replyArr){
    					replyValue += '<div>'
    					if(!isEmpty('${ sessionScope.loginUser.userId }')){
    						if(replyArr[i].userId === '${ sessionScope.loginUser.userId }' || '${ sessionScope.loginUser.userStatus }' === 'A'){
        						replyValue += '<button type="button" class="btn btn-secondary" onclick="deleteReportReply(this);">삭제</button>';
        						replyValue += '<button type="button" class="btn btn-secondary" onclick="update(this);">수정</button>';
    						}
    						if('${ loginUser.userId }' != replyArr[i].userId ){
    							replyValue += '<button type="button" class="btn btn-dark" onclick="reportReplyBlack(this);">신고하기</button>'
    						}
    					}
	    				replyValue += '<p style="margin-bottom: 0px;">' + replyArr[i].userId  + '</p>'
	    						   + '<p style="margin-bottom: 0px;">' + replyArr[i].bookReportReplyDate + '</p>'
	    						   + '<p class="replyContent">' + replyArr[i].bookReportReplyContent + '</p>'
	    						   + '<input type="hidden" value="' + replyArr[i].bookReportReplyNo +'">'
	    						   + '</div>';
    				}
    				
    				let previous = replyPi.currentPage - 1;
    				let next = replyPi.currentPage + 1;
    				
    				if(replyPi.currentPage == 1){
    					replyPiValue += '<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>';
    				} else{
    					replyPiValue += '<li class="page-item"><a class="page-link" onclick="selectReportReply('+ previous +');">Previous</a></li>';
    				}
    				for(let i = replyPi.startPage; i <= replyPi.endPage; i++){
    					replyPiValue += '<li class="page-item"><a class="page-link" onclick="selectReportReply(' + i + ');">' + i + '</a></li>';
    				}
    				if(replyPi['currentPage'] == replyPi['endPage']){
    					replyPiValue += '<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>';
    				} else{
    					replyPiValue += '<li class="page-item"><a class="page-link" onclick="selectReportReply('+ next +');">Next</a></li>';
    				}
    				$('#reportReply-area').html(replyValue);
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
	    			url : 'updateReply.bk',
	    			type : 'post',
	    			data : {
	    				replyNo : $(e).siblings("input[type=hidden]").val(),
	    				content : $(e).siblings("input[type=text]").val()
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
			
			let replyContent = $(e).siblings(".replyContent");
			let content = replyContent.text();
			
			replyContent.after('<input type="text" id="reportReplyContent" value="'+ content + '">');
			replyContent.remove();
			$(e).attr("onclick", "updateReportReply(this);");
    	}
	    		
   		function deleteReportReply(e){ // 댓글 삭제 ajax
       		$.ajax({
       			url : 'deletereportreply.bk',
       			type : 'post',
       			data : {
       				replyNo : $(e).siblings("input[type=hidden]").val(),
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
   			if(confirm("신고하시겠습니까?")){
   				$.ajax({
   	       			url : 'reportReplyBlack.bk',
   	       			type : 'post',
   	       			data : {
   	       				reportReplyNo : $(e).siblings("input[type=hidden]").val(),
   	       				blackId : $(e).next().text(),
   						userNo : '${ loginUser.userNo }'
   	       			},
   	       			success : result => {
   	       				console.log(result);
   	       				
   	       				if(result === 'success'){
   	       					alert('신고 완료');
   	       					selectReportReply();
   	  	    				} else{
   	  	    					alert('신고는 한번만 가능합니다');
   	  	    				}
   	       			},
   	       			error : () => {
   	       				console.log("댓글 통신 실패");
   	       			}
   	       		})
   			} else{
   				return;
   			}
       	}
    </script>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	<jsp:include page="../common/bookHeader.jsp" />
	<jsp:include page="../common/bookLeftBanner.jsp" />

    <div class="outer">
        <button type="button" class="btn btn-secondary" onclick="location.href='bookReport'">목록</button>
        <hr>

        <h3>
			 <c:forEach var="i" begin="1" end="${ br.bookReportStar }">
         		★
         	</c:forEach>
         	<c:out value="${ br.bookReportTitle }" />
		</h3>
        <p style="margin-bottom: 0px;">${ br.userId }</p>
        <span>${ br.bookReportDate }</span>
        <c:if test="${ not empty sessionScope.loginUser }">
	        <button type="button" class="btn btn-dark" onclick="reportBlackPost(${br.bookReportNo}, ${ loginUser.userNo });">신고하기</button>
	        <c:if test="${ loginUser.userId eq br.userId or sessionScope.loginUser.userStatus eq 'A' }">
		        <button type="button" class="btn btn-danger" onclick="reportDeletePost(${br.bookReportNo});">삭제</button>
		        <button type="button" class="btn btn-secondary" onclick="reportUpdatePost(${br.bookReportNo});">수정</button>
	        </c:if>
        </c:if>
        <script>
        	function reportBlackPost(reportNo, userNo){ // 신고버튼
        		
       			// form태그 생성
           		let form = document.createElement('form');
           		
           		// input[type=hidden]태그 생성 후 값 담음
           		let rNoInput = document.createElement('input');
           		rNoInput.setAttribute('type', 'hidden');
           		rNoInput.setAttribute('name', 'reportNo');
           		rNoInput.setAttribute('value', reportNo);
           		let uNoInput = document.createElement('input');
           		uNoInput.setAttribute('type', 'hidden');
           		uNoInput.setAttribute('name', 'userNo');
           		uNoInput.setAttribute('value', userNo);
           		
           		// form태그의 자식요소로 추가
           		form.appendChild(rNoInput);
           		form.appendChild(uNoInput);
           		
           		// form태그의 속성 추가
           		form.setAttribute('method', 'post');
           		form.setAttribute('action', 'reportBlack.bk');
           		
           		// body 안에 form태그 추가
           		document.body.appendChild(form);
           		
           		// 실행
           		form.submit();
        	}
        	
        	function reportDeletePost(reportNo){ // 삭제
        		// form태그 생성
        		let form = document.createElement('form');
        		
        		// input[type=hidden]태그 생성 후 값 담음
        		let rNoInput = document.createElement('input');
        		rNoInput.setAttribute('type', 'hidden');
        		rNoInput.setAttribute('name', 'reportNo');
        		rNoInput.setAttribute('value', reportNo);
        		
        		// form태그의 자식요소로 추가
        		form.appendChild(rNoInput);
        		
        		// form태그의 속성 추가
        		form.setAttribute('method', 'post');
        		form.setAttribute('action', 'reportDelete.bk');
        		
        		// body 안에 form태그 추가
        		document.body.appendChild(form);
        		
        		// 실행
        		form.submit();
        	}
        			
        	function reportUpdatePost(reportNo){ // 수정
       			// form태그 생성
           		let form = document.createElement('form');
           		
           		// input[type=hidden]태그 생성 후 값 담음
           		let rNoInput = document.createElement('input');
           		rNoInput.setAttribute('type', 'hidden');
           		rNoInput.setAttribute('name', 'reportNo');
           		rNoInput.setAttribute('value', reportNo);
           		
           		// form태그의 자식요소로 추가
           		form.appendChild(rNoInput);
           		
           		// form태그의 속성 추가
           		form.setAttribute('method', 'post');
           		form.setAttribute('action', 'reportUpdate.bk');
           		
           		// body 안에 form태그 추가
           		document.body.appendChild(form);
           		
           		// 실행
           		form.submit();
        	}
        </script>
        <hr>
        <p>
        	<c:out value="${ br.bookReportContent }" />
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
            <c:choose>
            	<c:when test="${ empty loginUser }">
            		<input type="text" placeholder="로그인 후 댓글을 남겨보세요" style="height: 50px; width: 90%;" readonly>
            	</c:when>
            	<c:otherwise>
            		<input type="text" placeholder="댓글을 남겨보세요" style="height: 50px; width: 90%;" id="reportReplyContent" maxlength="50">
		            <button type="submit" class="btn btn-secondary" style="height: 50px; width: 9%;" onclick="insertReportReply();">등록</button>
            	</c:otherwise>
            </c:choose>
        </div>
        
        <script>
	        $('#reportReplyContent').on('keypress', function(e){
				if(e.keyCode == 13){
					insertReportReply();
				}       				
			})
	     </script>




    </div>

</body>
</html>