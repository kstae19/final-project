<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style> 
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid palegreen;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        table * {margin:5px;}
        table {width:100%;}
    </style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	
	<div class="content">
		<br><br>
		<div class="innerOuter">
			<h2>게시글 상세보기</h2>
			<br>
			
			<a class="btn btn-secondary" style="float:right;" href="">목록으로</a>
			<br><br>
			
			<table id="contentArea" align="center" class="table">
				<tr>
					<th width="100">제목</th>
					<td colspan="3">${ b.title }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${ b.writer }</td>
					<th>작성일</th>
					<td>${ b.createDate }</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					
					<c:choose>
						<c:when test="${ empty b.originName }">
							<td colspan="3">첨부파일이 존재하지 않습니다.</td>
						</c:when>
						<c:otherwise>
							<td colspan="3">
								<a href="${ b.changeName }" download="${ b.originName }">${ b.originName }</a>
							</td>
						</c:otherwise>
					</c:choose>
					
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"></td>
				</tr>
				<tr>
					<td colspan="4"><p style="height:150px;">${ b.content }</p></td>
				</tr>	
			</table>
			<br>
			
			
			<c:if test="${ sessionScope.loginUser.userId eq b.writer }">
				<div align="center">
					<a class="btn btn-primary" onclick="postFormSubmit(0)">수정하기</a>
					<a class="btn btn-danger" onclick="postFormSubmit(1)">삭제하기</a>
				</div>
			</c:if>
			
			<form action="" method="post" id="postForm">
				<input type="hidden" name="bno" value="${ b.bno }">
				<input type="hidden" name="filePath" value="${ b.changeName }">
			</form>
			
			<script>
				function postFormSubmit(num) {
					if(num == 0){
						$('#postForm').attr('action', 'updateForm.bo').submit();						
					}
					else {
						$('#postForm').attr('action', 'delete.bo').submit();
					}
				}
			</script>
			
			
			<br><br>
			
			<table id="replyArea" class="table" align="center">
				<thead>
				
					<c:choose>
					<c:when test="${ empty sessionScope.loginUser }">
					<tr>
						<th colspan="2">
							<textarea class="form-control" readonly cols="55" rows="2" style="resize:none; width:100%;">로그인후 이용 가능</textarea>
						</th>
						<th style="vertical-align:middle"><button class="btn btn-secondary">등록하기</button></th>	
					</tr>
					</c:when>			
					<c:otherwise>
					<tr>
						<th colspan="2">
							<textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%"></textarea>
						</th>
						<th style="vertical-align:middle"><button class="btn btn-secondary" onclick="addReply();">등록하기</button></th>
					</tr>
					</c:otherwise>
					</c:choose>
					
					<tr>
						<td colspan="3">댓글(<span id="rcount">0</span>)</td>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</div>
		<br><br>
		
	</div>
	<script>
		
		$(function(){
			selectReplayList();
		});
		
		function addReply(){
			
			if($('#content').val().trim() != ''){
				$.ajax({
					url : 'rinsert.do',
					data : {
						refbno : ${b.bno},
						replayContent : $('#content').val(),
						replyWriter : '${sessionScope.loginUser.userId}'
					},
					success : function(result) {
						console.log(result);
					},
					error : function() {
						console.log('에베베베');
					}
					
				});
			}
		}
		else {
			alert('장난치지마라~');
		}
			
	}
	
	function selectReplyList(){
		$.ajax({
			url : 'rlist.do',
			data : {
				bno : ${b.bNo},
			},
			success : function(list){
				
				let value='';
				for(let i in list) {
					value += '<tr>'
					       + '<td>' + list[i].replyWriter + '</td>'
					       + '<td>' + list[i].replyContent + '</td>'
					       + '<td>' + list[i].createDate + '</td>'
					       +'</tr>'
				}
				$('#replyArea tbody').html(value);
				$('#rcount').text(list.length);
			},
			error : function(){
				console.log('ajax 댓글목록 조회 실패!');
			}
			
		});
		
	}
	
	function addReply(){
		
		if($('#content').val().trim() !=''){
			$.ajax({
				url : 'rinsert.do',
				data : {
					refbno : ${b.bNo},
					replyContent : $('#content').val(),
					replyWriter : '${sessionScope.loginUser.userId}'
				},
				success : function(result){
					console.log(result);
					
					if(result ==='success'){
						$('#content').val('');
						selectReplyList();
					}
				},
				error : function(){
					console.log('에베베베');
				}
				
			});
		}
		else{
			alert('장난치지마라~');
		}
		
	}
	</script>

	

</body>
</html>